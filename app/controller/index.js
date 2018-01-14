'use strict';
const moment = require("moment");
const shuffle = require('knuth-shuffle').knuthShuffle;
const $ = require('lodash');
module.exports = app => {
    class controller extends app.Controller {

        async about(ctx){
            this.body = await ctx.render('public/about.tpl');
        }
        async update(ctx){
            this.body = await ctx.render('public/update.tpl');
        }
        async login(ctx){
            if(ctx.request.body.username){
                let username = $.trim(ctx.request.body.username);
                let password = $.trim(ctx.request.body.password);
                if(ctx.service.user.login(username,password)){
                    ctx.cookies.set('username',ctx.helper.encode(username));
                    ctx.cookies.set('uid',ctx.helper.md5("user_"+username));
                    ctx.redirect("/");
                }
                // return;
            }
            this.body = await ctx.render('home/login.tpl');
        }
        async reg(ctx){
            this.body = await ctx.render('home/eg.tpl');
        }
        async authCallback(ctx){
            this.ctx.body = "xxx";
        }
    }
    return controller;
}