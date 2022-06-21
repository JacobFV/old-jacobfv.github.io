---
layout: post
title: The Master Plan (part 1)
date: 2022-06-20
description: The Master Plan to 
hidden: false
categories: [ai, idea]
tags:   [agi]
---

{% assign content = site.bio | where: "topic", "Focus Statement" | first %}
{{ content.content | markdownify }}