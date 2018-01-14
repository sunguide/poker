{% extends "../layout/layout.tpl" %}

{% block content %}

<div class="container main-container">
    <div class="timer">
        <span>计时器</span>
        <span class="countdown" data-time="0">00:00</span>
    </div>
    <div class="poker">
        <img class="poker_img" data-index="0" src="//sunguide.u.qiniudn.com/poker/0.jpg">
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
            return;
        }else if(index === 0){
            startTimer();
        }
        ++index;
        $(".poker_img").attr("src","//sunguide.u.qiniudn.com/poker/" + pokers[index] + ".jpg");
        $(".poker_img").attr("data-index",index);
    }
    function prevPoker() {
        let index = parseInt($(".poker_img").attr("data-index"));
        if(index === 0){
//            index = 54;
            return;
        }
        --index;
        $(".poker_img").attr("src","//sunguide.u.qiniudn.com/poker/" + pokers[index] + ".jpg");
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

    function startTimer() {
        let countDown = $(".timer .countdown");
        let start = countDown.data("start");
        if(start){
            return;
        }
        countDown.data("start",1);
        setInterval(function () {
            let time = parseInt(countDown.data("time"));
            if(time){
                time += 1;
            }else{
                time = 1;
            }
            countDown.data("time",time);
            let hours = Math.floor(time/60/60);
            let minutes = Math.floor((time - hours * 3600)/60);
            let seconds = Math.floor((time - hours * 3600 - minutes * 60));
            let show = hours ? hours.toString().padStart(2,"0") + ":" + minutes.toString().padStart(2,"0") + ":" +seconds.toString().padStart(2,"0"):minutes.toString().padStart(2,"0") + ":" + seconds.toString().padStart(2,"0");
            countDown.html(show);
        },1000);
    }
    $(document).ready(function () {

//        $activePage = $('#page-1');
//        $activePage.addClass('active');
        // Create an instance of Hammer with the reference.
        //初始化手势滑动
//        var container = document.getElementById('container'),
//            mc = new Hammer.Manager(container),
//            Swipe = new Hammer.Swipe();
//        mc.add(Swipe);
//        mc.on('swipeleft', function (e) {
//            swipteTo('next', e);
//        });
//        mc.on('swiperight', function (e) {
//            swipteTo('prev', e);
//        });
//        function swipteTo(slideType, e) {
//            var $targetPage = $activePage[slideType]('.page');
//            console.log($targetPage)
//            $targetPage.length && (location.hash = '#' + $targetPage.attr('id'));
//        }

    });
</script>
{% endblock %}
