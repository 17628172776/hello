<template>
  <div>
    <van-row type="flex" justify="center">
      <van-col span="24">
        <van-tabbar v-model="active" class="footercolor" active-color="#ef5b9c" safe-area-inset-bottom>
          <van-tabbar-item name="home" icon="home-o"  @click="main">主页</van-tabbar-item>
          <van-tabbar-item name="search" icon="invition" @click="saylove">表白</van-tabbar-item>
          <van-tabbar-item name="setting" icon="warning-o" @click="dynamic">临时公告</van-tabbar-item>
          <!-- <van-tabbar-item name="setting" icon="chat-o" @click="dynamic">消息</van-tabbar-item> -->
          <van-tabbar-item name="friends" icon="manager" @click="myHome">我的</van-tabbar-item>
        </van-tabbar>
      </van-col>
    </van-row>
  </div>
</template>

<script>
export default {
  name: "Footer",
  data() {
    return {
      active: 'home',
    }
  },
  methods: {
    back() {
      //后退
      this.$router.back();
    },
    forward() {
      this.$router.forward();
    },
    main() {
      this.$router.push("/main");
    },
    saylove() {
      this.$router.push("saylove");
    },
    myHome() {
      this.$router.push("myHomes");
    },
    dynamic() {
      this.$router.push("dynamic");
    },
  },
};
</script>

<style scoped>
.center {
  text-align: center;
}
.footercolor {
  background-color: #fde4eb;
}
.van-tabbar-item--active{
  background-color: #f8d5de;
}
</style>