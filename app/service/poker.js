'use strict';
const shuffle = require('knuth-shuffle').knuthShuffle;
const Cache = require('flat-cache');

module.exports = app => {
    class poker extends app.Service {
        constructor(ctx) {
            super(ctx);
        }

        async random(ctx) {

        }

        async history(){
            let cache = Cache.load('pokers');
            let pokers = await cache.all();
            console.log(pokers);
            return pokers;
        }

        getPoker(id){
            let cache = Cache.load('pokers');
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
        removePoker(id){
            if(id){
                let cache = Cache.load('pokers');
                return cache.removeKey(id);
            }
            return false;
        }

    }

    return poker;
};
