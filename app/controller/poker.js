'use strict';
const moment = require("moment");
const shuffle = require('knuth-shuffle').knuthShuffle;

module.exports = app => {
    class controller extends app.Controller {

        async index(ctx) {
            let data = {pokers:ctx.service.poker.getPoker()}
            this.body = await ctx.render('poker/index.tpl', data);

        }

        async training(ctx){
            let data = {};
            if(ctx.params.id === undefined || !ctx.params.id){
                data = ctx.service.poker.getPoker();
                // console.log(data);
                ctx.redirect("/training/" + data.id);
            } else {
                data = ctx.service.poker.getPoker(ctx.params.id);
            }
            this.body = await ctx.render('poker/training.tpl', data);
        }
        async history(ctx){
            let pokers = await ctx.service.poker.history();
            let data = {pokers:pokers};
            // console.log(data);
            this.body = await ctx.render('poker/history.tpl', data);
        }
    }
    return controller;
}