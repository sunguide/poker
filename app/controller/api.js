'use strict';
const moment = require("moment");
module.exports = app => {
    class apiController extends app.Controller {
        async removePoker(ctx){
            if(ctx.params.id === undefined || !ctx.params.id){
                this.error("id required");
            } else {
                let result = ctx.service.poker.removePoker(ctx.params.id);
                if(result){
                    this.error("remove fail");
                }else{
                    this.success("remove success");
                }
            }
        }
    }
    return apiController;
};
