'use strict';
const shuffle = require('knuth-shuffle').knuthShuffle;
const Cache = require('flat-cache');

module.exports = app => {
    class poker extends app.Service {
        constructor(ctx) {
            super(ctx);
        }
        async history(userId){
            let db = userId || "pokers";
            let cache = Cache.load(db);
            let pokers = await cache.all();
            return pokers;
        }

        getPoker(id,userId){
            let db = userId || "pokers";
            let cache = Cache.load(db);
            if(id){
                if(cache.getKey(id)){
                    let data = cache.getKey(id);
                    return {
                        id:id,
                        poker:data.poker,
                        created:data.created
                    };
                }else{
                    return false;
                }
            }
            //generate a poker
            let poker = [];
            for(let i = 1; i < 55; i ++){
                poker.push(i);
            }
            poker =  (shuffle(poker.slice(0)));
            //save to cache
            let now = Date.now();
            id = this.ctx.helper.md5(now.toString());
            cache.setKey(id, {
                poker:poker,
                created:now
            });
            cache.save(true);
            return {
                id:id,
                poker:poker,
                created:now
            };
        }
        removePoker(id,userId){
            let db = userId || "pokers";
            if(id){
                let cache = Cache.load(db);
                return cache.removeKey(id);
            }
            return false;
        }

    }

    return poker;
};
