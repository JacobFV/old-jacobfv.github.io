---
layout: about
title: Home
permalink: /
description: 

profile:
  align: right
  image: prof_pic.jpg

news: false  # includes a list of news items
selected_papers: false # includes a list of papers marked as "selected={true}"
social: true  # includes social icons at the bottom of the page
---

Hello! I'm an artificial intelligence researcher with experience in AI system design, implementation, and validation using tensorflow. During my past two years of research, I have applied AI to numerous problems with human-competitive performance in many cases. I am currently researching and developing the illusion vaguely identified by the terms: "human-level AI", "artificial general intelligence", "superintelligence", ... When I'm not interacting with artificial intelligences, you'll find me speaking to real people. I hope that includes you!

## Education

#### **The University of Texas at Arlington**<br>
B.S. Computer Science<br>
Enrolled: June 2020 – Present<br>
GPA 3.7/4.0; graduate Aug 2022<br>

#### **Navarro College**<br>
A.A.S. in Mathematics<br>
Enrolled: Sept 2014 – May 2018<br>
GPA 3.9/4.0; 85 hours taken<br>

## Employment

#### **ITLab** Developer<br>
June 2021 – Present, Remote<br>
- Collaborate with research group to develop and operate statistical
visualization tool CoWiz

#### **UTA Social Work** Developer<br>
June 2021 – Present, Remote<br>
- Maintain and enhance information system for social work research

#### **McDonald's** Crew Trainer<br>
May 2016 – Mar 2020, Midlothian TX<br>
- Led safety committee and addressed employees during 30-minute monthly
safety meetings
- Trained employees on-the-job and formally
- In addition to 4 years of formal Spanish education, actively used Spanish on-the-job

## Projects

{% for project in site.projects %}
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
      <p>{{project.description}}</p>
    {% endif %}
  </div>

{% endfor %}

## Certifications

**Google TensorFlow Developer Certification** April 2021<br>

**DeepLearning.AI TensorFlow Developer** Oct 2020<br>
**Deep Learning Specialization by DeepLearning.AI** Sept 2020<br>

**AWS Certified Developer – Associate** Mar 2019<br>
**AWS Certified SysOps Administrator – Associate** Mar 2019<br>
**AWS Certified Solutions Architect – Associate** Feb 2019<br>

## Teaching

#### [**ArtificialIntelligence:PrincipleandPractice**](https://jacobfv.github.io/Artificial-Intelligence-Principle-and-Practice/)<br>
- Independantly organized 8-day workshop on cutting-edge of artificial intelligence theory and technique
- Planned for October 2021