---
layout: page
permalink: /bio/
title: bio
description: About Jacob Valdez
---

Hello! I’m a machine learning engineer, roboticist, and entreprenuer at my startup, Limboid LLC, where I work to develop artificial general intelligence and affordable humanoid robots. During the day, I work as a software engineering intern at Motio Inc. I’m currently in a senior at the University of Texas at Arlington working towards my bachelor's degree in computer science. I love open source work, artificial intelligence, and robotics. When I'm not interacting with artificial agents, you'll find me working with real people. I hope that includes you!

{%- assign sorted_bio_entries = site.bio | sort: "order" -%}
{%- for qa_brief in sorted_bio_entries -%}
  {%- include qa_brief.html
    url=qa_brief.url
    title=qa_brief.title
    content=qa_brief.content
    redirect=qa_brief.redirect
    inline=qa_brief.inline
   -%}
{%- endfor %}

<div id="contact"></div> <!--don't change this id -->
## Let's talk

Please contact me via [SMS]({{ site.data.social.phone.id }}) or [email]({mailto:{{ site.data.social.email.id | encode_email }}}) so we can find a place for artificial intelligence in your next exciting project! I can usually make time to meet M-F 8am-6pm CT.

<form id="fs-frm" name="simple-contact-form" accept-charset="utf-8" action="https://formspree.io/f/xvolywep" method="post">
  <fieldset id="fs-frm-inputs">
    <label for="full-name">Full Name</label>
    <input type="text" name="name" id="full-name" placeholder="Name" required="">
    <label for="email-address">Email Address</label>
    <input type="email" name="_replyto" id="email-address" placeholder="your_email@example.com" required="">
    <label for="message">Message</label>
    <textarea rows="5" name="message" id="message" placeholder="I have this idea ..." required=""></textarea>
    <input type="hidden" name="_subject" id="email-subject" value="Contact Form Submission">
  </fieldset>
  <input type="submit" value="Submit">
</form>

Here's where you can find me in other places:

<div class="social">
  <div class="contact-icons">
    {% include social.html 
      starred_only=false
      detailed=true %}
  </div>

  <div class="contact-note">
    I have other accounts on the Internet, but the above are the ones I use to share ideas from, publish work, and perform other social activity. Internet activity appearing to be from me which is inconsistent with my personality associated with the above identities is probabbly not from me.
  </div>

</div>

