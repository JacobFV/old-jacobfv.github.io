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
---

Hello! I’m a machine learning researcher with experience in architecture design, implementation, and testing using numpy, tensorflow, and pytorch. I am currently researching and developing the illusion vaguely identified by the terms: "human-level AI", "artificial general intelligence", "superintelligence", ... When I'm not interacting with _artificial_ intelligences, you'll find me speaking to real ones. I hope that includes you!

## Education

#### **The University of Texas at Arlington**

B.S. Computer Science<br>
Enrolled: June 2020 – Present<br>
GPA 3.7/4.0; graduate Aug 2022

#### **Navarro College**

A.A.S. in Mathematics<br>
Enrolled: Sept 2014 – May 2018<br>
GPA 3.9/4.0; 85 hours taken

## Employment

#### **ITLab** Student Research Assistant

June 2021 – Present, Remote

- Collaborated with research group to evolve and test a flask-based statistical
  visualization tool CoWiz
- Currently developing a full stack web server MLN-Dashboard using Next-React-GraphQL stack

#### **UTA Social Work** Student Research Assistant

June 2021 – Present, Remote

- Maintain and enhance multi-platform (iOS and Android) data collecting application MyAmble using flutter and firebase and web administrator interface

#### **McDonald's** Crew Trainer

May 2016 – Mar 2020, Midlothian TX

- Led safety committee and addressed employees during 30-minute monthly
  safety meetings
- Trained employees on-the-job and formally
- In addition to 4 years of formal Spanish education, actively used Spanish on-the-job

## Projects

{% for project in site.projects reversed | sort: 'date' %}
{% if project.hidden != true %}

  <div>
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

**Google TensorFlow Developer Certification** April 2021

**DeepLearning.AI TensorFlow Developer** Oct 2020<br>
**Deep Learning Specialization by DeepLearning.AI** Sept 2020

**AWS Certified Developer – Associate** Mar 2019<br>
**AWS Certified SysOps Administrator – Associate** Mar 2019<br>
**AWS Certified Solutions Architect – Associate** Feb 2019
