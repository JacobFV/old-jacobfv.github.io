---
layout: post
title:  The Node Neural Network (NNN)
date:   2021-10-18
description: An architecture for increasingly general AI
---

The challenge is fusing them all togethor: 
- We already have reasonably well performing modality-specific architectures (VGG, BERT, WaveNet), but no general vision, language, audio architecture.
- We have foundation models (gpt3, ViT), but where are the foundation policies?
- What's the most efficient way to shuttle information from dataset to model?

I prpose developing a modular system to address these challanges: the *Node Neural Network (NNN)*. The following is a declarative description of what I intend to make:

The Node Neural Network is a modular deep learning architecture