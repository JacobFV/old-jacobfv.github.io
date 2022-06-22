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

## Contact

Would you like to collaborate on a project? Please contact me via <a href="tel:{{ phone.id | encode_phone }}">SMS</a> or <a href="mailto:{{ email.id | encode_email }}">email</a>. I can usually make time to meet M-F 8am-6pm CT.

<div id="contact" style="margin: 0.5rem; padding: 0.5rem; background-color: var(--global-bg-color-2); border-radius: 0.2rem; box-shadow: 0px 2px 5px #00000033;">
  {% assign phone = site.data.social | where: "type", "phone" | first %}
  {% assign email = site.data.social | where: "type", "email" | first %}

  {% include contact.html %}
</div>

<div class="social">
  <div class="contact-icons">
    {% include social.html 
      starred_only=false
      detailed=true %}
  </div>
</div>
