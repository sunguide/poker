'use strict';

module.exports = appInfo => {
    const config = {};

    // should change to your own
    config.keys = appInfo.name + '_1496902118915_8798';

    // add your config here
    config.view = {
        defaultViewEngine: 'nunjucks',
        mapping: {
            '.tpl': 'nunjucks',
        },
    };

    config.env = "prod";

    config.mongoose = {
        url: 'mongodb://10.0.30.61/xueqiu_helper',
        options: {}
    };
    config.redis = {
        client: {
            port: 6379,          // Redis port
            host: '10.0.30.61',   // Redis host
            password: 'fuckyou',
            db: 10,
        },
    }
    return config;
};

//
// module.exports = {
//   // 配置需要的中间件，数组顺序即为中间件的加载顺序
//   middleware: [ 'gzip' ],
//   // 配置 gzip 中间件的配置
//   gzip: {
//     threshold: 1024, // 小于 1k 的响应体不压缩
//   },
// };
