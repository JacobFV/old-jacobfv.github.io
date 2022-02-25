---
layout: page
permalink: /papers/
title: papers
description: papers by categories in reversed chronological order.
years: [2016, 2017, 2018, 2020, 2021, 2022]
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
