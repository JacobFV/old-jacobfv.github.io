---
layout: page
permalink: /bio/
title: bio
description:
nav: true
---

{% assign sorted_bio_entries = site.bio | sort: "order" %}
{% for qa_brief in sorted_bio_entries %}
  {% include qa_brief.html
    url=qa_brief.url
    topic=qa_brief.topic
    content=qa_brief.content
    redirect=qa_brief.redirect
    inline=qa_brief.inline
   %}
{% endfor %}

## Let's talk
<div id="contact"></div> <!--don't change this id -->

Want to work togethor on a project? See mistakes I overlooked? Please contact me via [SMS]({{ site.data.social.phone.id }}) or [email]({{ "mailto:" | append: site.data.social.email.id | encode_email }}) so we can find a place for artificial intelligence in your next exciting project! I can usually make time to meet M-F 8am-6pm CT.

{% include contact.html %}

<h2>Ways to find me</h2>

<div class="social">
  <div class="contact-icons">
    {% include social.html 
      starred_only=false
      detailed=true %}
  </div>
</div>
