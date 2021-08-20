<template>
  <div class="boxSize">
    <Header />
      <keep-alive>
        <router-view style="margin-top: 50px" v-if="$route.meta.keepAlive"></router-view>
      </keep-alive>
    <Footer />
  </div>
</template>

<script>
import Header from "./components/Header";
import Footer from "./components/Footer";

export default {
  name: "App",
  components: { Header, Footer },
  data() {
    return {};
  },
};
</script>
  
<style scopend>
.boxSize{
  max-height: 900px;
  max-width: 400px;
  text-align: center;
  margin: 0px auto;
}
</style> 