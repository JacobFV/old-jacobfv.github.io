---
layout: about
title: Home
permalink: /
description:

profile:
  align: right
  image: prof_pic.jpg

news: false # includes a list of news items
selected_papers: false # includes a list of papers marked as "selected={true}"
social: true # includes social icons at the bottom of the page
order: 1
---

Hello. Nice to meet you! My name's Jacob. I'm an entrepreneur, roboticist, and machine learning engineer at my startup Limboid LLC where I work to develop artificial general intelligence and affordable humanoid robots. To pay rent, I serve as an undergraduate research assistant in both the IT Lab and with the College of Social Work at the University of Texas at Arlington. I'm currently a senior there working on my bachelor's degree in computer science. I love open source work, artificial intelligence, and robotics. When I'm not interacting with artificial agents, you'll find me working with real people. I hope that includes you!

## Education

#### **The University of Texas at Arlington**

B.S. Computer Science<br>
Enrolled: June 2020 – Present<br>
GPA 3.7/4.0; graduate Aug 2022

#### **Navarro College**

A.A.S. in Mathematics<br>
Enrolled: Sept 2014 – May 2018<br>
GPA 3.9/4.0; 85 hours taken; Graduated Magna Cum Laude

#### **Waxahachie Global High School**

STEM classes + Navarro College and UT Tyler dual-credit program<br>
Student: Sept 2014 – May 2018<br>
GPA 3.9/4.0; 5.6/6.0; Graduated rank 7

## Employment

#### **ITLab** Student Research Assistant

June 2021 – Present

- Collaborated with research group to evolve and test a flask-based statistical visualization tool [CoWiz](https://github.com/banditsbeware/dash)
- Currently developing a full stack web server [MLN-Dashboard](https://github.com/JacobFV/mln-dashboard) using Next-React-GraphQL stack

#### **UTA Social Work** Student Research Assistant

June 2021 – Present

- Maintain and enhance multi-platform (iOS and Android) data collecting application [MyAmble](http://myamble.github.io/myamble-user-website) using flutter and firebase and web administrator interface

#### **McDonald's** Crew Trainer

May 2016 – Mar 2020, Midlothian TX

- Led safety committee and addressed employees during 30-minute monthly
  safety meetings
- Trained employees on-the-job and formally
- In addition to 4 years of formal Spanish education, actively used Spanish on-the-job

## Projects

{% for project in site.projects reversed | sort: 'date' %}
{% if project.hidden != true %}
  <div style={% cycle '"background-color: #80808008"', '"background-color: #0000"' %}>
    <h4>
      {% if project.redirect %}
      <a href="{{ project.redirect }}" target="_blank">
        <b>{{project.title}}</b>
      </a>
      {% else %}
      <a href="{{ project.url | relative_url }}">
        <b>{{project.title}}</b>
      </a>
      {% endif %}
      &nbsp;
      {{project.work_date}}
    </h4>
    {% if project.bullet_points %}
    <p>
      {{project.bullet_points}}
    </p>
    {% else %}
      <ul><li>{{project.description}}</li></ul>
    {% endif %}
  </div>
{% endif %}
{% endfor %}

## Certifications

**AWS Certified Machine Learning Engineer – Specialty** Feb 2022

**Google TensorFlow Developer Certification** April 2021

**DeepLearning.AI TensorFlow Developer** Oct 2020<br>
**Deep Learning Specialization by DeepLearning.AI** Sept 2020

**AWS Certified Developer – Associate** Mar 2019<br>
**AWS Certified SysOps Administrator – Associate** Mar 2019<br>
**AWS Certified Solutions Architect – Associate** Feb 2019

## Other Achievements

**TBHF Scholar Award Finalist** 2022
