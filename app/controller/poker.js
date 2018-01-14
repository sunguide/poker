'use strict';
const moment = require("moment");
const shuffle = require('knuth-shuffle').knuthShuffle;

module.exports = app => {
    class controller extends app.Controller {

        async index(ctx) {
            let uid = ctx.cookies.get('uid');
            let data = {pokers:ctx.service.poker.getPoker(uid)}
            this.body = await ctx.render('poker/index.tpl', data);
        }

        async training(ctx){
            let uid = ctx.cookies.get('uid');
            let data = {};
            if(ctx.params.id === undefined || !ctx.params.id){
                data = ctx.service.poker.getPoker(null,uid);
                // console.log(data);
                ctx.redirect("/training/" + data.id);
            } else {
                data = ctx.service.poker.getPoker(ctx.params.id,uid);
            }
            this.body = await ctx.render('poker/training.tpl', data);
        }
        async history(ctx){
            let uid = ctx.cookies.get('uid');
            let pokers = await ctx.service.poker.history(uid);
            let data = {pokers:pokers};
            // console.log(data);
            this.body = await ctx.render('poker/history.tpl', data);
        }
    }
    return controller;
}