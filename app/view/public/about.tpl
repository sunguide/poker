{% extends "../layout/layout.tpl" %}

{% block content %}
<div class="container main-container">
    <div class="row">
        <div class="about-container">
            <h1>{{ __('about.title') }}</h1>
            <p>{{ __('about.introduce') }}</p>
        </div>
    </div>
</div>
{% endblock %}