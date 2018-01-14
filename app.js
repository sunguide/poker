'use strict';
const Cache = require('flat-cache');
module.exports = app => {
    class CustomController extends app.Controller {
        constructor(ctx) {
            super(ctx);
            if(ctx.request.path !== "/login"){
                if(!ctx.cookies.get("uid")){
                    ctx.redirect("/login");
                }
            }
        }
        success(data,message) {
            message = message || "操作成功";
            this.ctx.body = {
                success: true,
                data,
                message
            };
        }
        error(msg) {
            msg = msg || '未知错误';
            this.ctx.body = {
                success:false,
                message:msg
            };
        }
    }
    app.Controller = CustomController;
    app.cache = Cache.load('pokers');
    app.locals = {
        "env": app.config.env
    };

    //passport 启用失败。可能组件有问题
    // app.passport.verify(async function (ctx, user) {
    //     // 假设login请求是由form发送，带有参数username, password
    //     var user = await ctx.service.user.findOne({name:user.username, pass:user.password});
    //     return user;
    // });

    return app;
};
