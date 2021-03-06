<?php

/**
 * 入口文件
 */

// 开始记录当前用户发送的表白数，在Seesion的生命周期内，最多限制3条。
session_start();
if (!isset($_SESSION['posts'])) {
  $_SESSION['posts'] = 1;
}

// 输出格式为UTF-8
header("Content-type:text/html; charset=utf-8");
$dateArr = file_get_contents("php://input");
$obj = json_decode($dateArr, TRUE);
if (isset($obj["act"])) {
  // 引入数据库连接类
  include_once 'connect.php';
  // 实例化数据库连接
  $connectDBS = new connectDataBase();

  // 引入配置类
  include_once "config.php";

  // 获取act参数，该参数控制需要执行的功能
  $action = $connectDBS->test_input($obj["act"]);

  // 获取用户IP，检测用户IP是否在黑名单内，在的话就退出执行。
  $ip = $connectDBS->getIP();
  $sql = "SELECT count(*) FROM `saylove_2021_blacklist` WHERE `ip` = '$ip'";
  $res = mysqli_query($connectDBS->link, $sql);
  $result = mysqli_fetch_array($res);
  $num = $result[0];
  if ($num != 0) {
    // 退出执行php，所有操作无效
    exit(0);
  }
  // echo $ip;
  switch ($action) {
    case 'say':
      // 表白
      // 
      // 如果posts大于3的话，则超出当前session 的生命周期内限制的表白数。防止无限post攻击
      if (isset($_SESSION['posts']) && $_SESSION['posts'] < config::$base_config['max_submit_post']) {
        $_SESSION['posts'] = $_SESSION['posts'] + 1;
        include_once 'say.php';
        $nickName = $connectDBS->test_input($obj["nickName"]);
        $trueName = $connectDBS->test_input($obj["trueName"]);
        $towho = $connectDBS->test_input($obj["toWho"]);
        $email = $connectDBS->test_input($obj["email"]);
        $contents = $connectDBS->test_input($obj["contents"]);
        $gender = $connectDBS->test_input($obj["gender"]);
        $itsGender = $connectDBS->test_input($obj["itsGender"]);
        $images = $connectDBS->test_input($obj["image"]);
        $say = new sayWords($connectDBS->link, $nickName, $trueName, $towho, $contents, $email, $ip, $gender, $itsGender, $images);
        if ($email != "") {
          include_once 'email.php';
          $send = new sendEmail();
          $send->sendOut($connectDBS->link, $say->uid, $email);
        }
        //只取路径
        // $url = $_SERVER['PHP_SELF'];
        // $url = "./share.php?id=" . $say->uid;
        // echo '点击链接查看你的表白：<br><a target="_blank" href=' . $url . '>戳我！</a><br>';
      } else {
        // 超过3条表白，则输出。无法完成表白
        echo "你很棒嘛";
      }
      break;
    case 'liked':
      include_once 'like.php';
      $post_id = $connectDBS->test_input($obj["post_id"]);
      if (isset($_COOKIE[$post_id])) {
        # code...
        echo 'error';
      } else {
        $expire = time() + 60;
        setcookie($post_id, $post_id, $expire);
        $like = new liked($connectDBS->link, $ip, $post_id);
      }
      break;
    case 'comment':
      include_once 'comment.php';
      $comment = $connectDBS->test_input($obj["comment"]);
      $post_id = $connectDBS->test_input($obj["post_id"]);
      $insertcomment = new comment();
      $insertcomment->insertComment($connectDBS->link, $post_id, $comment, $ip);
      break;
    case 'getComment':
      include_once 'comment.php';
      $post_id = $connectDBS->test_input($obj["post_id"]);
      $insertcomment = new comment();
      $insertcomment->getComment($connectDBS->link, $post_id);
      break;
    case 'load':
      include_once 'display.php';
      $show = new display();
      $mode = $connectDBS->test_input($obj["mode"]);
      $show->show($connectDBS->link,$mode);
      break;
    default:
      # code...
      break;
  }
  mysqli_close($connectDBS->link);
} else {
  echo "请求错误！";
}
