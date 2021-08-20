<?php  
header("Access-Control-Allow-Origin:*");
// 响应类型
header('Access-Control-Allow-Methods:POST');
// 响应头设置
header('Access-Control-Allow-Headers:x-requested-with, content-type');
header("Content-type: text/html; charset=utf-8");

$head = 'http://'; //这里是传输协议
$ip = '127.0.0.1:8081'; //填入你自己域名或者ip地址能访问到的
$file = file_get_contents("php://input");
$files = explode(",",$file );  //分割字符串
$types = explode(":", $files[3]); //不会写正则，，只能这样分割
$types1 = explode(";", $types[2]); //拿到了data类型
$arr = str_split($types1[0],6); //按长度分割字段
$type = $arr[1]; //获得了图片扩展名
$image = $files[4]; //拿到图片的base64码子

$path='../upload/';  //创建保存的路径
is_dir($path) || mkdir($path,0777,true);  //判断是否要存在文件夹，不存在就以最高权限创建
$fileName = date('Ymd',time()).random_int(10,99).'.'.$type; //生成新的文件名
$newfileName =  $path.$fileName; //拼接上传路径
$images =  base64_decode($image); //还原图片

if(file_put_contents("$newfileName","$images", $base64_image_content)){ 
    echo $head.$ip.'/api/upload/'.$fileName; //判断是否移动成功，返回拼接的地址  这里根据你的情况来拼接
}else{
    echo'保存失败';
}

?>