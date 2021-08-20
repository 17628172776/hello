<template>
  <div>
    <van-nav-bar
      class="headertext"
      title="表白网"
      left-text=""
      right-text=""
      fixed
      @click-left="onClickLeft"
      @click-right="onClickRight"
    />
  </div>
</template>

<script>
import { Toast } from "vant";
export default {
  name: "Header",
  data() {
    return {
      p: 1,
    };
  },
  methods: {
    onClickLeft() {
      this.$router.back();
    },
    onClickRight() {
      Toast("按钮");
    },
  },
};
</script>

<style scoped>
.headertext {
  padding-bottom: 4px;
  background-color: #ffe0dd;
}
</style>