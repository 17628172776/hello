<?php
class liked
{
  function __construct($link, $ip, $post_id)
  {
    $sql = "UPDATE `saylove_2021_posts` set love=love+1 where id='$post_id'";
      mysqli_query($link, $sql);
      $sql_in = "INSERT INTO `saylove_2021_like` (posts_id,ip) VALUES ('$post_id','$ip')";
      mysqli_query($link, $sql_in);
    $result = mysqli_query($link,"SELECT `love` FROM `saylove_2021_posts` WHERE id='$post_id'");
      $row = mysqli_fetch_array($result);
      $love = $row['love'];
    echo "$love";
  }
}

?>
