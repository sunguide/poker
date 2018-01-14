<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" type="image/x-icon" href="//static.touker.com/hbec/favicon.ico"/>
    <meta content="yes" name="apple-mobile-web-app-capable">
    <!-- 全屏显示 -->
    <meta content="yes" name="apple-touch-fullscreen">
    <!-- 全屏显示 -->
    <meta content="telephone=no,email=no" name="format-detection">
    <!-- 不启用电话，邮件 -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <!-- 以原始大小显示，并不允许缩放 -->
    <meta name="format-detection" content="address=no"/>
    <!-- 不启用地址 -->
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <!-- 在web app应用下状态条（屏幕顶部条）的颜色为黑色 -->
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <!-- 网站开启对web app程序的支持 -->
    <meta name="mobile-web-app-capable" content="yes"/>
    <!-- 删除默认的苹果工具栏和菜单栏 -->
    <meta name="apple-touch-fullscreen" content="yes"/>
    <!-- 添加到主屏幕“后，全屏显示 -->
    <meta name="full-screen" content="yes"/>
    <!-- 全屏显示 -->
    <title>Poker</title>

    <!--<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" />-->
    <!--<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"/>-->
    <!-- 引入样式 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <link rel="stylesheet" href="/public/css/main.css"/>
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.slim.min.js"></script>
    <link rel="icon" href="/public/favicon.png" type="image/x-icon">
    <title>{% block title %}雪球助手 | 大数据分析雪球海量数据 {% endblock %}</title>
</head>
<body>
<div id="wrapper">
    <div id="header" class="affix">
        <div class="title">
            <h1>扑克记忆训练</h1>
            <span>一个高效的扑克记忆训练工具。</span>
        </div>
    </div>

    {% block content %}{% endblock %}
</div>
<div id="footer">
    <div class="inner">
        <ul class="link">
            <li><a href="/">首页</a></li>
            <li><a href="/about">关于我们</a></li>
            <li><a href="/update">升级计划</a></li>
        </ul>
        <div class="copyright">
            <p>Copyright © 2018 记忆助手{{ app.env }} v1.0.1</p>
        </div>
    </div>
</div>
<div class="hide" id="toast-message">{{ toast }}</div>
<!--javascript-->
<script src="//cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
{% if env == "prod" %}
{% else %}
<script src="/public/js/vconsole.min.js"></script>
{% endif %}
<script src="/public/js/common.js"></script>
</body>
</html>
