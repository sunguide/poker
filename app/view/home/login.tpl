{% extends "../layout/layout.tpl" %}

{% block content %}
<section class="container main-container">

    <div class="form-behavior" style="text-align: center;margin: 20px;">
        <span>注册即登录</span>
    </div>

    <div class="inner">
        <form class="user-login-form" id="user-login" action="/login" accept-charset="UTF-8" method="post">
            <input name="utf8" type="hidden" value="✓">

            <!-- start [input] -->
            <div class="h5ui-group">
                <div class="h5ui-form">
                    <label for="username" class="h5ui-form-label">用户名</label>
                    <input type="text" id="username" name="username" class="h5ui-form-input" placeholder="输入用户名">
                </div>

                <div class="h5ui-form">
                    <label for="password" class="h5ui-form-label">密码</label>
                    <input type="password" id="password" name="password" class="h5ui-form-input" placeholder="设置登录密码">
                </div>
            </div>
            <input class="button primary" style="display: block;width: 200px;margin: auto;" type="submit" value="登录">
        </form>
        <div class="help-section">

        </div>

    </div>
</section>
<script>
    $(".ajax-post").click(function () {

        function csrfSafeMethod(method) {
            // these HTTP methods do not require CSRF protection
            return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
        }
        $.ajaxSetup({
            beforeSend: function(xhr, settings) {
                if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
                    xhr.setRequestHeader('x-csrf-token', csrftoken);
                }
            },
        });
        $.post("/loginDo",$("#user-login").serialize(),function (err,res) {
            if(err){
                console.log(err);
            }else{

            }
        })
    });
</script>
{% endblock %}
