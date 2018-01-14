'use strict';

module.exports = app => {
  app.get('/', 'poker.index');
  app.get('/training/:id', 'poker.training');
  app.get('/training', 'poker.training');
  app.get('/history', 'poker.history');
  app.get('/api/poker/remove/:id', 'api.removePoker');
  app.get('/about', 'index.about');
  app.get('/update', 'index.update');
  app.get('/login', 'index.login');
  // 登录校验
  // const options = {
  //     successRedirect:'/auth/admin',
  //     failureRedirect: '/login'
  // };
  // const local = app.passport.authenticate('local', options);
  // console.log(local);
  // app.post('/login', local);

  app.post("/login", 'index.login');
  app.get("*",function(){

  })
};
