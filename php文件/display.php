<?php

/**
 * 输出数据
 *
 * BY https://pingxonline.com/
 */

include_once 'config.php';

class display
{
    // public $maxItems = 18;   
    //  一页显示的条数
    function __construct()
    {
        # code..
    }
    /**
     * 表白显示的方式
     * @param  [object] $link [数据库链接]
     * @param  [int] $page [页数，第几页]
     * @param  [string] $mode [排序显示的模式名字]
     * @return [type]       [无返回]
     */
    public function show($link, $mode)
    {
        // 每页最多N条表白显示。具体数值修改config.php文件
        $maxItems = config::$base_config['max_item'];
        switch ($mode) {
            case '0': //0：默认按点赞数多少显示全部；
                $mysql = "SELECT * FROM `saylove_2021_posts` WHERE `isDisplay` = '0' ORDER BY `love` DESC ";
                $arr_address = mysqli_query($link, $mysql);

                $this->output($arr_address, $link); //输出posts
                break;
            case '1': //1：按时间倒序显示；
                $mysql = "SELECT * FROM `saylove_2021_posts` WHERE `isDisplay` = '0' ORDER BY `mtime` DESC";
                $arr_address = mysqli_query($link, $mysql);

                $this->output($arr_address, $link); //输出posts
                break;
            case '2': //点赞数最少排序
                $mysql = "SELECT * FROM `saylove_2021_posts` WHERE isDisplay = '0' ORDER BY `love` ASC ";
                $arr_address = mysqli_query($link, $mysql);

                $this->output($arr_address, $link); //输出posts
                break;
            case '3': //最旧帖子时间
                $mysql = "SELECT * FROM `saylove_2021_posts` WHERE isDisplay = '0' ORDER BY `mtime` ASC LIMIT ";
                $arr_address = mysqli_query($link, $mysql);

                $this->output($arr_address, $link); //输出posts
                break;
            case '4': //
                # code...
                break;
        }
    }

    /**
     * 遍历输出表白
     * @param  [type] $arr_address [数据库查询的返回值]
     * @param  [type] $link        [数据库链接]
     * @return [type]              [输出json格式的表白到前端JS渲染]
     */
    public function output($arr_address, $link)
    {
        $arr = array();
        while ($row = mysqli_fetch_assoc($arr_address)) {
            $arrSub = array();
            //获取评论总数
            $posts_id = $row['id'];
            $total_comments_sql = "SELECT COUNT('posts_id') FROM `saylove_2021_commtents` WHERE posts_id = '$posts_id'";
            $total_comments_result = mysqli_fetch_array(mysqli_query($link, $total_comments_sql));
            $total_comments = $total_comments_result[0];

            //获取猜名字总数 -- 猜对的
            // $total_guess_sql = "SELECT COUNT('posts_id') FROM `saylove_2021_guess` WHERE posts_id = '$posts_id' AND isRight = '1'";
            // $total_guess_result = mysqli_fetch_array(mysqli_query($link,$total_guess_sql));
            // $total_guess = $total_guess_result[0];

            //获取猜名字总数 -- 总数
            // $total_guess_sql = "SELECT COUNT('posts_id') FROM `saylove_2021_guess` WHERE posts_id = '$posts_id'";
            // $total_guess_result = mysqli_fetch_array(mysqli_query($link,$total_guess_sql));
            // $total_guess_all = $total_guess_result[0];

            //获取数据总数
            $total_sql = "SELECT COUNT(*) FROM `saylove_2021_posts` where isDisplay = '0'";
            $total_result = mysqli_fetch_array(mysqli_query($link, $total_sql));
            $total = $total_result[0];
            // $total_page = floor($total/$this->maxItems);

            $arrSub['id'] = $posts_id;
            $arrSub['nickName'] = $row['nickName'];
            $arrSub['toWho'] = $row['toWho'];
            $arrSub['contents'] = $row['contents'];
            $arrSub['love'] = $row['love'];
            // $arrSub[] = $total_guess; 名字
            $arrSub['total_comments'] = $total_comments;
            $arrSub['mtime'] = $row['mtime'];
            // $arrSub[] = $total_page; 页数
            // $arrSub[] = $total_guess_all; 拆名字正确的
            $arrSub['gender'] = $row['gender'];
            $arrSub['itsGender'] = $row['itsGender'];
            $arrSub['total'] = $total; //总数
            $arrSub['images'] = $row['images'];
            $arr[] = $arrSub;
        }
        echo json_encode($arr);
    }
}
