<template>
  <div class="text-box">
    <van-pull-refresh v-model="refreshing" @refresh="onRefresh" :disabled='isDisabled' >
      <!-- 下拉提示 -->
      <template #pulling="props">
        <img
          class="doge"
          src="https://img01.yzcdn.cn/vant/doge.png"
          :style="{ transform: `scale(${props.distance / 80})` }"
        />
      </template>

      <!-- 释放提示 -->
      <template #loosing>
        <img class="doge" src="https://img01.yzcdn.cn/vant/doge.png" />
      </template>

      <!-- 加载提示 -->
      <template #loading>
        <img class="doge" src="https://img01.yzcdn.cn/vant/doge-fire.jpg" />
      </template>

      <van-list
        v-model="loading"
        :finished="finished"
        finished-text="没有更多了"
        @load="onLoad"
      >
        <van-sticky>
          <van-search
            v-model="search"
            placeholder="请输入搜索关键词"
            background="#feeeed"
            shape="round"
          />
        </van-sticky>

        <div ref="article-content">
          <!-- 渲染列表 -->
          <van-cell v-for="taget in filterP" :key="taget.id">
            <div class="text-conte">
              <div>
                <div class="targaetname">
                  <span :class="taget.gender">{{ taget.nickName }}</span>
                  <van-icon name="like" color="#ef5b9c" />
                  <span :class="taget.itsGender">{{ taget.toWho }}</span>
                </div>
                <!-- <van-divider content-position="left">分割线</van-divider> -->
                <p class="contents">{{ taget.contents }}</p>
                <div class="grid-img-box">
                  <div
                    v-for="(s, index) in picture(taget.images)"
                    :key="index"
                    @click="addimages(picture(taget.images), index)"
                    class="grid-img"
                  >
                    <van-image
                      v-if="s"
                      fit="cover"
                      lazy-load
                      :src="s"
                      show-loading
                      show-error
                      width="95%"
                      height="95%"
                    >
                    </van-image>
                  </div>
                </div>

                <p class="textabs">{{ taget.mtime }}</p>

                <div class="list-footer">
                  <belowButton
                    v-bind:love="taget.love"
                    v-bind:id="taget.id"
                    v-bind:comments="taget.total_comments"
                  />
                </div>
              </div>
            </div>
          </van-cell>
        </div>
      </van-list>
    </van-pull-refresh>
  </div>
</template>

<script>
//引入axios
import axios from "axios";
import belowButton from "./belowButton";
import { ImagePreview } from "vant";
export default {
  name: "Main",
  components: { belowButton },
  data() {
    return {
      lists: [],
      loading: false,
      finished: false,
      refreshing: false,
      isDisabled:false,
      search:'',
      filpensons: [],
    };
  },
  mounted() {
    this.$bus.$on('isDisabled', (data)=>{
      this.isDisabled = data
    })
  },
  beforeDestroy() {
    this.$bus.$off('isDisabled')
    console.log('已销毁')
  },
  methods: {
    addimages(s, index) {
      // 得到所传入的 img 节点
      ImagePreview({
        images: s, //接收为数组
        startPosition: index, //图片索引
        closeable: true, //预览可以关闭
      });
    },

    onLoad() {
      //刷新状态
      setTimeout(() => {
        if (this.refreshing) {
          this.lists = []; //清空lists数组重新获取
          this.refreshing = false; //改变状态
        }
        axios({
          method: "post",
          url: "/api/php/action.php",
          data: { act: "load", mode: "1" },
        }).then(
          (response) => {
            // console.log(response);
            this.lists = response.data; //把返回的数据缓存在lists数组
            // console.log(this.lists)
              this.loading = false; //关闭loading
              this.finished = true; //更改状态为完成           
          },
          (error) => {
            console.log("请求失败了", error.message); //错误输出
          }
        );
      }, 500);
    },

    onRefresh() {
      // 清空列表数据
      this.finished = false;
      // 重新加载数据
      // 将 loading 设置为 true，表示处于加载状态
      this.loading = true;
      //去重新请求数据
      this.onLoad();
    },
    picture(images) {
      //分离图片路径
      let imagesrc = images.split("#");
      for (var i = 0; i < imagesrc.length; i++) {
        if (imagesrc[i] == undefined || imagesrc[i] == "") {
          imagesrc.splice(i, 1);
          i = i - 1; // i - 1 ,因为空元素在数组下标 2 位置，删除空之后，后面的元素要向前补位，
          // 这样才能真正去掉空元素,觉得这句可以删掉的连续为空试试，然后思考其中逻辑
        }
        return imagesrc;
      }
    },
  },
  computed: {
    filterP() {
      //搜索

      const {search ,lists } = this; // 结构赋值
      let listtwo = [...lists];
      if (search.trim()) {
        //遍历的是对象内的值
        listtwo =lists.filter((p) => p.nickName.indexOf(search) !== -1 || p.toWho.indexOf(search) !== -1  );
      }return listtwo;
    },
  },
};
</script>

<style scoped >
.text-box {
  margin-top: 50px;
  margin-bottom: 50px;
}
.text-conte {
  border: 1px solid rgb(206, 203, 203);
  border-radius: 8px;
  background-color: #faeaed13;
  margin: 2px;
  box-shadow: 1px 1px 3px rgb(228, 222, 222);
}
.targaetname {
  padding-top: 10px;
  padding-bottom: 10px;
  border-radius: 5px 5px 5px 5px;
  background-color: #ffeeec;
  border: 1px solid rgb(245, 229, 229);
  
}
.male {
  display: inline;
  margin-right: 10px;
  margin-left: 20px;
  color: #03a9f4;
  border-bottom: 2px dashed #03a9f4;
  line-height: 30px;
  text-shadow: 0 1px 0 #f3f3f3;
  font-family: "Microsoft YaHei";
}
.female {
  display: inline;
  margin-right: 10px;
  margin-left: 10px;
  color: #ff3333;
  border-bottom: 2px dashed #ff3333;
  line-height: 30px;
  text-shadow: 0 1px 0 #f3f3f3;
  font-family: "Microsoft YaHei";
}
.secrecy {
  display: inline;
  margin-right: 10px;
  margin-left: 10px;
  color: #424242;
  border-bottom: 2px dashed #424242;
  line-height: 30px;
  text-shadow: 0 1px 0 #f3f3f3;
  font-family: "Microsoft YaHei";
}
.contents {
  word-break: break-word;
  text-indent: 2em;
  padding: 10px;
  color: #333;
  text-align: left;
  text-shadow: 0 1px 0 #f3f3f3;
}
.textabs {
  text-align: right;
  margin-right: 15px;
  margin-top: 10px;
  margin-bottom: 10px;
  color: rgb(160, 155, 151);
}
.grid-img-box {
  text-align: center;
}
.grid-img {
  display: inline-block;
  width: 100%;
  height: 100%;
  text-align: center;
  margin: 1px;
}
.grid-img:only-child {
  width: 100%;
  height: 100%;
}
.grid-img:nth-child(2n + 1):nth-last-child(2),
.grid-img:nth-child(2n + 2):last-child {
  width: 168px;
  height: 155px;
}
.grid-img:nth-child(3n + 1):nth-last-child(3),
.grid-img:nth-child(3n + 2):nth-last-child(2),
.grid-img:nth-child(3n + 3):last-child {
  width: 109px;
  height: 105px;
}

.grid-img:nth-child(4n + 1):nth-last-child(4),
.grid-img:nth-child(4n + 2):nth-last-child(3),
.grid-img:nth-child(4n + 3):nth-last-child(2),
.grid-img:nth-child(4n + 4):last-child {
  width: 168px;
  height: 135px;
}
.doge {
  width: 102px;
  height: 49px;
  margin-top: 1px;
  border-radius: 4px;
}
</style>