#!/usr/bin/env php
<?php
/**
 * Created by PhpStorm.
 * User: staff
 * Date: 16/3/16
 * Time: 17:15
 */

//访问天气数据https://api.heweather.com/x3/weather?cityid=城市ID&key=你的认证key的工具
$ch = curl_init();
$url = 'https://api.heweather.com/x3/weather?cityid=CN101020100&key=1108c8fb59cb4aa3a1a0e24df690ce46';
// 执行HTTP请求
curl_setopt($ch , CURLOPT_URL , $url);
curl_setopt($ch , CURLOPT_SSL_VERIFYPEER , false);
$res = curl_exec($ch);
echo $res;
?>