---
layout: home
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

Hello. Nice to meet you! My name's Jacob. I'm an entrepreneur, roboticist, and machine learning engineer at my startup Limboid LLC where I work to develop artificial general intelligence and affordable humanoid robots. To pay rent, I serve as an undergraduate research assistant in both the IT Lab and with the College of Social Work at the University of Texas at Arlington. I'm currently a senior there working on my bachelor's degree in computer science. I love open source work, artificial intelligence, and robotics. When I'm not interacting with artificial agents, you'll find me working with real people. I hope that includes you! [more &rangle; &rangle;]({{ site.baseurl }}/bio)

## Education

<div class="container">
  <div class="row row-cols-1">
    {% assign sorted_education = site.data.education | sort: "start" | reverse %}
    {% for education in sorted_education %}
      {% include horz_card.html
      img=education.image
      title=education.school
      subtitle=education.degree
      start=education.start
      end=education.end
      description=education.misc %}
    {% endfor %}
  </div>
</div>

## Employment

<div class="container">
  <div class="row row-cols-1">
    {% assign sorted_jobs = site.jobs | sort: "start" | reverse %}
    {% for job in sorted_jobs %}
      {% include horz_card.html
        img=job.img
        title=job.role
        subtitle=job.company
        subtitle_url=job.company_url
        start=job.start
        end=job.end
        location=job.location
        description=job.description
       %}
    {% endfor %}
  </div>
</div>

## Projects

<div class="container">
  <div class="row row-cols-1">
    {% assign sorted_projects = site.projects | sort: "importance" | reverse %}
    {% for project in sorted_projects %}

    {% if project.redirect %}
    {% assign url = project.redirect %}
    {% else %}
    {% assign url = project.url | relative_url %}
    {% endif %} 

    {% if project.hidden != true %}
      {% include horz_card.html
      img=project.img
      title=project.title
      url=url
      subtitle=project.description
      date=project.date
      start=project.start
      end=project.end
      github=project.github
      github_stars=project.github_stars
      description=project.bullet_points
      %}
    {% endif %}
    {% endfor %}
  </div>
</div>

## Certifications

<div class="container">
  <div class="row row-cols-1">
  {% assign sorted_certifications = site.data.misc.certifications | sort: "date" | reverse %}
  {% for certification in sorted_certifications %}
    {% include thin_horz_card.html
    title=certification.name
    display_date=achievement.display_date
    date=certification.date %}
  {% endfor %}
  </div>
</div>

<br>

## Achievements

<div class="container">
  <div class="row row-cols-1">
  {% assign sorted_achievements = site.data.misc.achievements | sort: "date" | reverse %}
  {% for achievement in sorted_achievements %}
    {% include thin_horz_card.html
    title=achievement.name
    subtitle=achievement.organization
    date=achievement.date
    display_date=achievement.display_date
    description=achievement.reason %}
  {% endfor %}
  </div>
</div>