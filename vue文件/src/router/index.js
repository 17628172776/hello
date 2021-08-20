//该文件专门用于创建路由器
import VueRouter from 'vue-router'
import Main from '../components/main/Main'
import Saylove from '../pages/Saylove'
import myHomes from '../pages/myHomes'
import Dynamic from '../pages/Dynamic'

export default new VueRouter({
    routes: [
        {
            name: 'main',
            path: '/',
            component: Main,
            meta: {
                keepAlive: true, //此组件需要被缓存
                isBack: false, //用于判断上一个页面是哪个
            }
        },
        {
            name: 'main',
            path: '/main',
            component: Main,
            meta: {
                keepAlive: true, //此组件需要被缓存
                isBack: false, //用于判断上一个页面是哪个
            }
        },
        {
            name: 'saylove',
            path: '/saylove',
            component: Saylove,
            meta: {
                keepAlive: true, //此组件不需要被缓存
                isBack: false, //用于判断上一个页面是哪个
            }
        },
        {
            name: 'myhomes',
            path: '/myhomes',
            component: myHomes,
            meta: {
                keepAlive: true, //此组件不需要被缓存
                isBack: false, //用于判断上一个页面是哪个
            }
        },
        {
            name: 'dynamic',
            path: '/dynamic',
            component: Dynamic,
            meta: {
                keepAlive: true, //此组件不需要被缓存
                isBack: false, //用于判断上一个页面是哪个
            }
        }


    ],
})
//解决路由多次报错
const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push(location) {
    return originalPush.call(this, location).catch(err => err)

}
