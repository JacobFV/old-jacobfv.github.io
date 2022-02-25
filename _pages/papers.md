---
layout: page
permalink: /papers/
title: papers
description: papers by categories in reversed chronological order.
years: [2022, 2021, 2020, 2018, 2017, 2016]
# years: [1956, 1950, 1935, 1905]
nav: false
order: 10
---
<!-- _pages/publications.md -->
<div class="publications">

{%- for y in page.years %}
  <h2 class="year">{{y}}</h2>
  {% bibliography -f papers -q @*[year={{y}}]* %}
{% endfor %}

</div>
