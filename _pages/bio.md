---
layout: page
permalink: /bio/
title: bio
description: About Jacob Valdez
---

Hello! I’m a machine learning engineer, roboticist, and entreprenuer at my startup, Limboid LLC, where I work to develop artificial general intelligence and affordable humanoid robots. During the day, I work as a software engineering intern at Motio Inc. I’m currently in a senior at the University of Texas at Arlington working towards my bachelor's degree in computer science. I love open source work, artificial intelligence, and robotics. When I'm not interacting with artificial agents, you'll find me working with real people. I hope that includes you!

{% assign sorted_bio_entries = site.bio | sort: "order" %}
{% for qa_brief in sorted_bio_entries %}
  {% include qa_brief.html
    url=qa_brief.url
    title=qa_brief.title
    content=qa_brief.content
    redirect=qa_brief.redirect
    inline=qa_brief.inline
   %}
{% endfor %}

<div id="contact"></div> <!--don't change this id -->
## Let's talk

Want to work togethor on a project? See mistakes I overlooked? Please contact me via [SMS]({{ site.data.social.phone.id }}) or [email]({{ "mailto:" | append: site.data.social.email.id | encode_email }}) so we can find a place for artificial intelligence in your next exciting project! I can usually make time to meet M-F 8am-6pm CT.

{% include contact.html %}

<br>

Here's where you can find me online and elsewhere:

<div class="social">
  <div class="contact-icons">
    {% include social.html 
      starred_only=false
      detailed=true %}
  </div>
</div>
