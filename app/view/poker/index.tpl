{% extends "../layout/layout.tpl" %}

{% block content %}

<div class="container main-container">

    <div class="menu">
        <a class="button primary" href="/training">重新开始</a>
        <a class="button info" href="/history">历史回顾</a>
    </div>
</div>
<script>
    let pokers = "{{ pokers }}".split(",");
    $(".poker_img").click(function () {
        let index = parseInt($(this).attr("data-index"));
        if(index === 54){
            index = 0;
        }
        console.log(index)
        $(this).attr("src","public/images/" + pokers[index] + ".jpg");
        $(this).attr("data-index",++index);
    });
</script>
{% endblock %}
