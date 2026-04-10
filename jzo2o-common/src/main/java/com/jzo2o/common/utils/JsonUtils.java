package com.jzo2o.common.utils;

import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONUtil;

public class JsonUtils extends JSONUtil {
    
    /**
     * 判断字符串是否为 JSON 格式
     * @param str 待判断的字符串
     * @return 是否为 JSON 格式
     */
    public static boolean isJson(String str) {
        if (StrUtil.isEmpty(str)) {
            return false;
        }
        try {
            String trimmed = str.trim();
            return (trimmed.startsWith("{") && trimmed.endsWith("}")) 
                || (trimmed.startsWith("[") && trimmed.endsWith("]"));
        } catch (Exception e) {
            return false;
        }
    }
}