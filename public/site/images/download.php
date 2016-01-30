<?php

$path = $_GET["f"];
//$path = urldecode($path);


$agent=strtoupper($_SERVER['HTTP_USER_AGENT']);
$isIE=(strpos($agent,'MSIE')!==false || strpos($agent,'TRIDENT')!==false);

if ($isIE) {
    $path = iconv("big5", "utf8", $path);
}

if (!isset($path) || !is_file($path)) {
    echo $path;
    header("HTTP/1.0 404 Not Found");
    exit;
}

$filename = basename($path);
$pos = strrpos($path, "/") + 1;
$filename = substr($path, $pos, strlen($path) - $pos);
//echo $filename;
//exit;


if ($isIE) {
    $filename = iconv("utf8", "big5", $filename);
}

header('Content-Type: application/octet-stream');
header("Content-Transfer-Encoding: Binary"); 
header("Content-disposition: attachment; filename=\"" . $filename . "\""); 
readfile($path); // do the double-download-dance (dirty but worky)