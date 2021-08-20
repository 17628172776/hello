<template>
  <div>
    <van-row type="flex" style="margin-top: 8px">
      <van-col span="12" ></van-col>

      <van-col span="4"  :style="{ color: iscolors }">
          <van-icon
            name="thumb-circle"
            size="1.5rem"
            @click="addlike(id)"
            ref="likecolor"
          />
          {{ loves }}

        <!-- 展示点赞 -->
      </van-col>

      <van-col span="4"  style="color:#908E8E">
        <van-icon name="chat" size="1.5rem" @click="commmentClike" />
        {{comments}}
        <!-- 展示评论 -->
        <van-popup v-model="show" closeable round  @close="isclose">
          
            <!-- 在Comment组件 -->
            <Comment  v-bind:id="id" />
          
        </van-popup>
      </van-col>

      <van-col span="4" >
        <van-icon
          name="share"
          size="1.5rem"
          @click="showShare = true"
          color="#908E8E"
        />
        <van-share-sheet
          v-model="showShare"
          title="立即分享给好友"
          :options="options"
          @select="onSelect"
        />
        <!-- 展示分享 -->
      </van-col>
    </van-row>
    <div></div>
  </div>
</template>

<script>
import { Toast } from "vant";
import axios from "axios";
import Comment from "./Comment";
export default {
  components:{Comment},
  name: "belowButton",
  props: ["love", "id" ,"comments"],
  data() {
    return {
      show:false,
      showShare: false,
      options: [
        { name: "微信", icon: "wechat" , a:'暂时不做微信'},
        { name: "QQ", icon: "qq" , a:'暂时不做QQ'},
        { name: "复制链接", icon: "link", a:'暂时不做链接'},
        { name: "分享海报", icon: "poster" , a:'暂时不做海报'},
        { name: "二维码", icon: "qrcode" , a:'暂时不做二维码'},
      ],
      loves: this.love,
      loveColor: JSON.parse(localStorage.getItem(this.id)),
      iscolor: "",
    };
  },
  computed: {
    iscolors() {
      let a = JSON.parse(localStorage.getItem(this.id));
      if (a) {
        return "#FA8E86"; //本地有值为红色
      } else {
        return "#908E8E"; //本地无值为灰色
      }
    },
  },
  methods: {

    commmentClike(){
      this.$bus.$emit('isDisabled',true)
      this.show = true;
    },

    isclose(){
      this.$bus.$emit('isDisabled',false)
    },

    addstyle(a, b) {
      localStorage.setItem(a, JSON.stringify(b));
      //缓存点赞的id值
    },

    onSelect(option) {
      Toast(option.a);
      this.showShare = false;
    },

    addlike(id) {
      if (JSON.parse(localStorage.getItem(this.id)) == undefined) {
        axios({
          method: "post",
          url: "/api/php/action.php",
          data: { act: "liked", post_id: id },
        }).then((res) => {
          if (res.data != "error") {
            this.loves = res.data; //更新点赞数量
            this.addstyle(this.id, "true");
            setTimeout(() => {
              this.$refs.likecolor.style.color = "#FA8E86";
              //设置点赞后的颜色
            }, 100);
          } else {
            Toast("点赞失败了");
          }
        });
      } else {
        Toast("已经点过赞了");
      }
    },
  },
};
</script>

<style scoped>
.colors {
  color: #fa8e86;
}
.colors1 {
  color: #908e8e;
}
.text-centers {
  display: inherit;
  position: relative;
}

</style>