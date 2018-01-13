{% extends "../layout/layout.tpl" %}

{% block content %}

<div class="container main-container">

    <div class="menu">
        <a class="button primary" href="/">返回首页</a>
    </div>
    {% for id,poker in pokers %}
    <div class="history">
        <a href="/training/{{ id }}">
            {{ helper.datetime("YYYY-MM-DD HH:mm:ss",poker.created) }}
        </a>
    </div>
    {% endfor %}
</div>
<script>

</script>
{% endblock %}