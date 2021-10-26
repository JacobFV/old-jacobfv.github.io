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

The Node Neural Network is an iterative update deep learning architecture composed of a network of *nodes* (modules) that are connected by *coonnections* between *ports* on the nodes. 

**Learning**: All learning is local to the node:
- connection formation/growth/prunning
- node binary fision and node death
- node internal parameter updates

**Energy**: All nodes must conform to an energy budget which is distributed by the energy management system and appropriately penalize activations or computations. Energy is supplied by the developer on each iteration step and the `nnn` library includes a compute energy estimation function.

**Optional Computation**: No signal -- even input signals -- except energy is required to be present. The NNN is a sparse self-gated network of experts and nodes output `None` if they do not activate.

**Nodes** may be specialized or common. Common nodes share a sparse activation distribution which facilitates open-ended growth. Common nodes include:
- PredNode
- SORNNode
- SOMPNode
- ...

Specialized nodes represent a (part of a) specific ML model. Their ports must be specifically labeled corresponding to the expected flow of information. `nnn` includes:
- `nnn.nodes.specialized.bert`
- `nnn.nodes.specialized.gpt3`
- `nnn.nodes.specialized.vit`
- `nnn.nodes.specialized.wavenet`
- `nnn.nodes.specialized.xlm`
- `nnn.nodes.specialized.triple_graph` can be initialized empty or with DBPedia, Wikidata, other queryable knowledge graphs.
- `nnn.nodes.specialized.gym_env`
- `nnn.nodes.specialized.gym_env`
- ...

From a developer perspective, the NNN features:
- parametrized interface (API default, but can be overriden by obs/action spec)
- iterative update architecture; integrates with Salina
- multimodal and multienvironment learning


