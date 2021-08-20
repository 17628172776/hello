module.exports = {
   
    //开启代理
    devServer: { //跨域
        port: "8080", //端口号
        host: "localhost",
        open: true, //配置自动启动浏览器
        proxy: { // 配置跨域处理 可以设置多个
          '/api': {
            target: 'http://localhost:8081',//跨域请求头信息
            changeOrigin: true,
            ws: false,
            secure: false, // 如果是https接口，需要配置这个参数
            pathRewrite: {
              '^/api': ''
            }
          }
        }
      },
    

}