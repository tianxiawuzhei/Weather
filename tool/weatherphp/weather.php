#!/usr/bin/env php
<?php
/**
 * Created by PhpStorm.
 * User: staff
 * Date: 16/3/16
 * Time: 17:15
 */

/*
 * 访问天气数据https://api.heweather.com/x3/weather?cityid=城市ID&key=你的认证key的工具
 */

if ($argc < 2) {
    // ask for input
    fwrite(STDOUT, "Enter your cityid: ");

    // get input
    $cityid = trim(fgets(STDIN));
} else {
//    echo './weahter.php --id CN101010300';
    $longopts  = array(
        "id:",     // Required value
    );
    $options = getopt(null, $longopts);
    $cityid = $options["id"];
}

$cu = curl_init();
$url = <<<EOD
https://api.heweather.com/x3/weather?cityid=$cityid&key=1108c8fb59cb4aa3a1a0e24df690ce46
EOD;

echo "\n";
echo "url = $url";
echo "\n\n";

// 执行HTTP请求
curl_setopt($cu , CURLOPT_URL , $url);
curl_setopt($cu , CURLOPT_SSL_VERIFYPEER , false);
$res = curl_exec($cu);
echo $res;
?>