'use strict';
const shuffle = require('knuth-shuffle').knuthShuffle;
const Cache = require('flat-cache');

module.exports = app => {
    class user extends app.Service {
        constructor(ctx) {
            super(ctx);
        }

        async login(username, password){
            let cache = Cache.load('users');
            if(username){
                if(cache.getKey(username)){
                    let data = cache.getKey(username);
                    return data;
                }
                return false;
            }else{
                cache.setKey(username, {
                    password:password,
                    created:Date.now()
                });
                return cache.save(true);
            }
        }
        async findOne({}){
            return true;
        }
    }

    return user;
};
