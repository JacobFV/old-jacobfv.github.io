---
layout: page
permalink: /papers/
title: papers
description: papers by categories in chronological order.
years: [2022, 2021, 2020, 2018, 2017, 2016]
nav: false
# order: 10
---
<!-- _pages/publications.md -->
<div class="publications">

{% for y in page.years %}
  <h2 class="year">{{y}}</h2>
  {% bibliography -f mypapers -q @*[year={{y}}]* %}
{% endfor %}

</div>
