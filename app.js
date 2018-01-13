'use strict';
const Cache = require('flat-cache');
module.exports = app => {
    class CustomController extends app.Controller {
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
};
