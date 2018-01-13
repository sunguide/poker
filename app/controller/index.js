'use strict';
const moment = require("moment");
const shuffle = require('knuth-shuffle').knuthShuffle;

module.exports = app => {
    class controller extends app.Controller {

        async about(ctx){
            this.body = await ctx.render('public/about.tpl');
        }
        async update(ctx){
            this.body = await ctx.render('public/update.tpl');
        }
    }
    return controller;
}