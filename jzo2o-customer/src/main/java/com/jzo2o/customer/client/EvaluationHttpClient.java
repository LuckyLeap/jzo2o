package com.jzo2o.customer.client;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.crypto.SecureUtil;
import cn.hutool.http.Header;
import cn.hutool.http.HttpRequest;
import cn.hutool.json.JSONUtil;
import com.jzo2o.common.constants.ErrorInfo;
import com.jzo2o.common.expcetions.CommonException;
import com.jzo2o.common.model.CurrentUserInfo;
import com.jzo2o.customer.properties.EvaluationProperties;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

/**
 * 评价系统对接http工具类
 **/
@Component
public class EvaluationHttpClient {
    @Resource
    private EvaluationProperties evaluationProperties;

    /**
     * 默认连接超时时间
     */
    private static final Integer DEFAULT_CONNECTION_TIMEOUT = 3000;

    /**
     * 默认读取超时时间
     */
    private static final Integer DEFAULT_READ_TIMEOUT = 5000;

    /**
     * post请求
     * @param currentUserInfo 当前用户信息
     * @param url             请求地址
     * @param parameters      请求参数
     * @param body            请求体
     * @return 响应数据
     */
    public <T> String post(CurrentUserInfo currentUserInfo, String url, Map<String, Object> parameters, T body) {
        return post(currentUserInfo, url, parameters, body, null, DEFAULT_CONNECTION_TIMEOUT, DEFAULT_READ_TIMEOUT);
    }

    /**
     * post请求，自定义请求头
     * @param currentUserInfo 当前用户信息
     * @param url             请求地址
     * @param parameters      请求参数
     * @param body            请求体
     * @param headers         请求头
     * @return 响应数据
     */
    public <T> String post(CurrentUserInfo currentUserInfo, String url, Map<String, Object> parameters, T body, Map<String, String> headers) {
        return post(currentUserInfo, url, parameters, body, headers, DEFAULT_CONNECTION_TIMEOUT, DEFAULT_READ_TIMEOUT);
    }

    /**
     * post请求，自定义连接时间
     * @param currentUserInfo   当前用户信息
     * @param url               请求地址
     * @param parameters        请求参数
     * @param body              请求体
     * @param headers           请求头
     * @param connectionTimeout 连接超时时间
     * @param readTimeout       读取超时时间
     * @return 响应数据
     */
    public <T> String post(CurrentUserInfo currentUserInfo, String url, Map<String, Object> parameters, T body, Map<String, String> headers, Integer connectionTimeout, Integer readTimeout) {
        //生成token
        String token = this.generateToken(currentUserInfo);

        //组装请求参数
        if (ObjectUtil.isNotEmpty(parameters)) {
            url = getCompleteUrl(url, parameters);
        }

        //组装请求
        HttpRequest httpRequest = HttpRequest.post(url)
                .header(Header.AUTHORIZATION, token)
                .setConnectionTimeout(connectionTimeout)
                .setReadTimeout(readTimeout);

        //组装header
        if (ObjectUtil.isNotEmpty(headers)) {
            headers.forEach(httpRequest::header);
        }

        //组装请求体
        if (ObjectUtil.isNotEmpty(body)) {
            httpRequest.body(JSONUtil.toJsonStr(body));
        }

        //发起请求
        String result = httpRequest.execute().body();

        //校验http响应结果
        checkResult(result);

        return result;
    }

    /**
     * get请求
     * @param currentUserInfo 当前用户信息
     * @param url             请求地址
     * @param parameters      请求参数
     * @return 响应数据
     */
    public String get(CurrentUserInfo currentUserInfo, String url, Map<String, Object> parameters) {
        return get(currentUserInfo, url, parameters, DEFAULT_CONNECTION_TIMEOUT, DEFAULT_READ_TIMEOUT);
    }

    /**
     * get请求，自定义连接时间
     * @param currentUserInfo   当前用户信息
     * @param url               请求地址
     * @param parameters        请求参数
     * @param connectionTimeout 连接超时时间
     * @param readTimeout       读取超时时间
     * @return 响应数据
     */
    public String get(CurrentUserInfo currentUserInfo, String url, Map<String, Object> parameters, Integer connectionTimeout, Integer readTimeout) {
        //生成token
        String token = this.generateToken(currentUserInfo);

        //组装请求参数
        if (ObjectUtil.isNotEmpty(parameters)) {
            url = getCompleteUrl(url, parameters);
        }

        //发起请求
        String result = HttpRequest.get(url)
                .header(Header.AUTHORIZATION, token)
                .setConnectionTimeout(connectionTimeout)
                .setReadTimeout(readTimeout)
                .execute().body();

        //校验http响应结果
        checkResult(result);

        return result;
    }

    /**
     * delete请求
     * @param currentUserInfo 当前用户信息
     * @param url             请求路径
     * @param parameters      请求参数
     * @return 响应数据
     */
    public String delete(CurrentUserInfo currentUserInfo, String url, Map<String, Object> parameters) {
        return delete(currentUserInfo, url, parameters, DEFAULT_CONNECTION_TIMEOUT, DEFAULT_READ_TIMEOUT);
    }

    /**
     * delete请求，自定义连接时间
     * @param currentUserInfo   当前用户信息
     * @param url               请求路径
     * @param parameters        请求参数
     * @param connectionTimeout 连接超时时间
     * @param readTimeout       读取超时时间
     * @return 响应数据
     */
    public String delete(CurrentUserInfo currentUserInfo, String url, Map<String, Object> parameters, Integer connectionTimeout, Integer readTimeout) {
        //生成token
        String token = this.generateToken(currentUserInfo);

        //组装请求参数
        if (ObjectUtil.isNotEmpty(parameters)) {
            url = getCompleteUrl(url, parameters);
        }

        //发起请求
        String result = HttpRequest.delete(url)
                .header(Header.AUTHORIZATION, token)
                .setConnectionTimeout(connectionTimeout)
                .setReadTimeout(readTimeout)
                .execute().body();

        //校验http响应结果
        checkResult(result);

        return result;
    }

    /**
     * 校验http响应结果
     * @param result http响应
     */
    private void checkResult(String result) {
        String code = JSONUtil.parseObj(result).get("code").toString();
        if (ObjectUtil.equal("608", code)) {
            throw new CommonException(ErrorInfo.Code.HTTP_EVALUATION_FAILED, "禁止重复提交");
        }

        if (ObjectUtil.notEqual("200", code)) {
            throw new CommonException(ErrorInfo.Code.HTTP_EVALUATION_FAILED, "对接评价系统，http请求失败");
        }
    }

    /**
     * 拼接请求参数
     * @param url        请求路径
     * @param parameters 参数
     * @return 完整请求地址
     */
    private String getCompleteUrl(String url, Map<String, Object> parameters) {
        StringBuilder stringBuilder = new StringBuilder(url);
        if (ObjectUtil.isNotEmpty(parameters)) {
            stringBuilder.append("?");

            parameters.forEach((k, v) -> {
                stringBuilder.append(k);
                stringBuilder.append("=");
                stringBuilder.append(v.toString());
                stringBuilder.append("&");
            });
        }
        return stringBuilder.substring(0, stringBuilder.length() - 1);
    }

    /**
     * 生成评价系统token
     * @param currentUserInfo 当前用户信息
     * @return token
     */
    public String generateToken(CurrentUserInfo currentUserInfo) {
        //评价系统配置
        String appId = evaluationProperties.getAppId();
        String accessKeyId = evaluationProperties.getAccessKeyId();
        String accessKeySecret = evaluationProperties.getAccessKeySecret();

        if (ObjectUtil.isEmpty(appId) || ObjectUtil.isEmpty(accessKeyId) || ObjectUtil.isEmpty(accessKeySecret)) {
            throw new CommonException(ErrorInfo.Code.HTTP_EVALUATION_FAILED, "评价系统配置信息不完整");
        }

        //当前用户信息
        Map<String, Object> payload = new HashMap<>();
        payload.put("id", currentUserInfo.getId().toString());
        payload.put("nickName", currentUserInfo.getName());
        payload.put("userAvatar", currentUserInfo.getAvatar());
        payload.put("appId", appId);
        payload.put("accessKeyId", accessKeyId);

        //生成payload字符串
        String jwtPayload = JSONUtil.toJsonStr(payload);
        //生成签名
        byte[] signBytes = SecureUtil.hmacSha256(accessKeySecret).digest(jwtPayload);
        //生成签名字符串
        String signature = Base64.getUrlEncoder().withoutPadding().encodeToString(signBytes);

        return jwtPayload + "." + signature;
    }
}