<?php
  /**
   * 表白提交
   * @return 插入成功返回id，插入失败返回false
   */
  class sayWords
  {
    public $uid = "";
    function __construct($link,$nickName,$tureName,$toWho,$contents,$email,$ip, $gender, $itsGender, $images)
    {
      $sql = "INSERT INTO `saylove_2021_posts`(`nickName`, `tureName`, `toWho`, `gender`, `itsGender`, `contents`, `email`, `ip`, `images`) VALUES ('$nickName', '$tureName', '$toWho', '$gender', '$itsGender', '$contents', '$email', '$ip', '$images')";
      $statu = mysqli_query($link, $sql);
      if ($statu) {
        // 成功
        $uid = mysqli_insert_id($link); //取得上一步操作产生的 ID
        // return $uid;
        $this->uid = $uid;
        echo "ok";
         
      } else {
        # 失败
        return false;
      }

    }
  }

 ?>
