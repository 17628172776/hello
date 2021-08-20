<template>
  <div class="cesi">
    <p class="titletage">快来评论吧~</p>
    <div>
      <div class="ul-list" v-show="isdisplay">
        <ul class="ul-type">
          <li v-for="(c, index) in commentList" :key="c.id">
            <van-row type="flex" justify="space-between">
              <van-col span="12">
                <van-image
                  round
                  width="2rem"
                  height="2rem"
                  src="http://vue.conputer.xyz/api/upload/cesiiamge.jpg"
                />
                <span>{{ c.ip }}</span>
              </van-col>
              <van-col offset="8" span="4">
                <van-tag
                  plain
                  type="primary"
                  text-color="#F59890"
                  style="margin-right: 0"
                  >{{ index + 1 }}楼</van-tag
                >
              </van-col>
            </van-row>

            <!-- <van-tag plain type="primary" text-color="#F59890">{{ index + 1 }}楼</van-tag> -->
            <p>{{ c.contents }}</p>

            <div class="right-type">
              <!-- <a href="">回复</a> -->
              <span>{{ c.mtime }}</span>
            </div>
            <van-divider></van-divider>
          </li>
        </ul>
      </div>
      <div v-show="!isdisplay">
        <span>还没有评论呢，赶快评论吧~ 点击下方评论哦~</span>
      </div>

      <div class="">
        <van-field
          v-model="writtenWords"
          rows="1"
          autosize
          label="评论"
          type="textarea"
          maxlength="50"
          placeholder="请输入评论"
          show-word-limit
        >
        <template #button>
          <van-button size="small" color="#F2BCBC" @click="addtext">发送评论</van-button>
        </template>
        </van-field>
        <!-- <input type="text" v-model="writtenWords" /> -->
        
        <!-- <button @click="addtext">评论</button> -->
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { Toast } from 'vant';
export default {
  name: "Comment",
  props: ["id"],
  data() {
    return {
      commentList: [],
      isdisplay: false,
      writtenWords: "",
    };
  },
  methods: {
    addtext() {
      this.writtenWords =this.writtenWords.trim()  //去除空格
      if(this.writtenWords !== ''){
        axios({
        method: "post",
        url: "/api/php/action.php",
        data: { act: "comment", comment: this.writtenWords, post_id: this.id },
      }).then(
        (response) => {
          // console.log(response)
          if (response.data == "ok") {
            Toast("评论成功~")
            this.writtenWords = "";
            //重新获取数据
            axios({
              method: "post",
              url: "/api/php/action.php",
              data: { act: "getComment", post_id: this.id },
            }).then(
              (response) => {
                // console.log(response);
                this.commentList = response.data;
                if (this.commentList.length == 0) {
                  this.isdisplay = false; //没有评论就显示占位
                } else {
                  this.isdisplay = true; //有评论就展示评论
                }
              },
              (error) => {
                console.log("请求失败了", error.message); //错误输出
              }
            ); //这里结束
          }
          //清空输入框
        },
        (error) => {
          console.log("请求失败了", error.message); //错误输出
        }
      );


      }else{
        Toast("输入为空！")
      }
      
    },
  },
  mounted() {
    // 挂载的时候执行
    axios({
      method: "post",
      url: "/api/php/action.php",
      data: { act: "getComment", post_id: this.id },
    }).then(
      (response) => {
        // console.log(response);
        this.commentList = response.data;
        if (this.commentList.length == 0) {
          this.isdisplay = false;
        } else {
          this.isdisplay = true;
        }
      },
      (error) => {
        console.log("请求失败了", error.message); //错误输出
      }
    );
  },
};
</script>

<style scoped>
.cesi {
  width: 340px;

  background-color: rgb(252, 236, 236);
  border: 1px solid rgb(248, 163, 148);
  border-radius: 16px;
}
.ul-list {
  max-height: 300px;
  width: 100%;
  overflow: auto;

  background-color: rgb(255, 255, 255);
}
ul {
  width: 98%;
  background-color: rgb(250, 250, 250);
  margin: 1px;
}

.titletage {
  font-size: 1.3em;
  text-align: center;
  color: rgb(129, 128, 128);
}
p {
  text-indent: 30px;
}
.right-type {
  width: 100%;
  display: inline-block;
  text-align: right;
  color: rgb(160, 155, 151);
}
</style>