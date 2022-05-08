---
layout: page

title: Copyright Calculator

hidden:
redirect:
category: [school]
importance: 30

date: 2014-09-16 #  YYYY-MM-DD, must be specified
start:
end:
display_date: # used instead of `date` or date range

img: assets/img/copyright_calculator.png
github: JacobFV/Copyright-Calculator # uname/repo, don't include the prefix `https://github.com/`

description: Scripted conversation bot to help students stay safe
bullet_points: | # at least two bullet points
  - Helps students avoid plagiarism
  - Hybrid Google site and Web 1.0 app *written in text editor!*
---

The Copyright Calculator is a tool designed for 2014-2015 Waxahachie ISD students which aids in the selection of material that falls under fair use. It consists of a small library of information as well as an interactive app that, after information has been fed to, tells the student whether he/she qualifies for fair use. It does not however claim liability for misuse.

I wrote this application in the early morning hours of Fall 2014 in a text editor on my Windows 8 Surface tablet. Life was hard back then. I didn't have autocomplete, codex, or anything like that. And since I updated the DOM by using the ancient approach `Document.getElementById(...).innerHTML = ...`, I often didn't even have syntax highlighting. There were backslashes all over the place -- especailly in parts of the app where the dynamically generated HTML was being used to generate more content!

A while ago Google told me that they were going to disband their Google sites so I lost most of this project. You can still find some of it in my [Github repo](https://github.com/JacobFV/Copyright-Calculator).

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
      {% include figure.html path="assets/img/copyright_calculator.png" title="Copyright Calculator Homepage" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
      {% include figure.html path="assets/img/copyright_orig.png" title="Copyright Calculator Advisor" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
