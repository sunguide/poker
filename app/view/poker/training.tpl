{% extends "../layout/layout.tpl" %}

{% block content %}

<div class="container main-container">
    <div class="poker">
        <img class="poker_img" data-index="0" src="/public/images/0.jpg">
    </div>
    <div class="page-nav">
        <a href="javascript:;" class="button float-left prev" title="下一页">上一页</a>
        <a href="javascript:;" class="button float-right next" title="上一页">下一页</a>
    </div>
</div>
<script src="//cdn.staticfile.org/hammer.js/2.0.8/hammer.min.js"></script>
<script>
    let pokers = [0].concat("{{ poker }}".split(","));
    function nextPoker(){
        let index = parseInt($(".poker_img").attr("data-index"));
        if(index === 54){
//            index = 0;
        }
        ++index;
        $(".poker_img").attr("src","/public/images/" + pokers[index] + ".jpg");
        $(".poker_img").attr("data-index",index);
    }
    function prevPoker() {
        let index = parseInt($(".poker_img").attr("data-index"));
        if(index < 0){
//            index = 54;
        }
        --index;
        $(".poker_img").attr("src","/public/images/" + pokers[index] + ".jpg");
        $(".poker_img").attr("data-index",index);
    }
    $(".poker_img").click(function () {
        nextPoker();
    });
    $(".prev").click(function () {
        prevPoker();
    });
    $(".next").click(function () {
        nextPoker();
    });
    $(document).ready(function () {
        $activePage = $('#page-1');
        $activePage.addClass('active');
        // Create an instance of Hammer with the reference.
        //初始化手势滑动
        var container = document.getElementById('container'),
            mc = new Hammer.Manager(container),
            Swipe = new Hammer.Swipe();
        mc.add(Swipe);
        mc.on('swipeleft', function (e) {
            swipteTo('next', e);
        });
        mc.on('swiperight', function (e) {
            swipteTo('prev', e);
        });
        function swipteTo(slideType, e) {
            var $targetPage = $activePage[slideType]('.page');
            console.log($targetPage)
            $targetPage.length && (location.hash = '#' + $targetPage.attr('id'));
        }

    });
</script>
{% endblock %}
