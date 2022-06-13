---
layout: page

title: "<code>Labatron</code>"

hidden:
redirect:
category: [school]
importance: 3

date: 2016-10-01 #  YYYY-MM-DD, must be specified
start: 2016-10-01
end: 2017-05-01
display_date: # used instead of `date` or date range

img: assets/img/labatron.png
github: JacobFV/Labatron # uname/repo, don't include the prefix `https://github.com/`

description: Automated stochiometry solver for CHEM 1411/12
bullet_points: | # at least two bullet points
    - Automated stochiometry solver for CHEM 1411/12
    - Programmed in C# with Visual Studio
---

Chemistry Labatron outputs a .csv containing work shown for Chemistry class. Input equations in form "X+Y->A+B" with optional physical state indicators yield a fully worked out stochiometry equation. Example: "CH4(g)+2O2(g)->2H2O(l)+CO2(g)". I can't remember receiving less then a perfect score on any labs I used this program on!

{% include figure.html path="assets/img/labatron.png" title="Labatron outputs" class="img-fluid rounded z-depth-1" %}
