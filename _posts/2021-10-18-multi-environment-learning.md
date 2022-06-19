---
layout: post
title:  Multi-Environment Learning
date:   2021-10-18
description: Another paradigm for increasingly general AI
categories: [ai, ideas]
tags:   [agi]
---

Multi-environment learning extends the single environment RL paradigm to multiple environments. It's like multiagent learning -- except your only controlling one agent in multiple environments. In this paradigm, the policy $\pi : o_1, o_2, \dots \rightarrow a_1, a_2, \dots$ takes an observation $o_1, o_2, \dots$ from different environments and produces actions $a_1, a_2, \dots$ for all of them simultaneously on each step. You might have a collection loop like:
```python
while True:
    observations = [env.obs for env in envs]
    actions = policy(observations)
    for env, action in zip(envs, actions):
        env.step(action)
```

**Advantages**: At first I couldn't see why anyone would even want to use this paradigm. After all, if your environments are disjoint, learning to stack blocks probabbly won't make much a difference on `CartPole`. It's especially unnecesary to observe both environments simultaneously. However, when your problem domain is in the open-ended world, it is helpful to learn intrinsic priors of logic, social skills, or commonsense knowledge from a simpler area and then apply that information to a more complex environment *in context*. When we train our policies in sequential cirricula, the information has to flow from the environment to the weights before it can be used in a later environment. With the multi-environment approach however, policies can learn to access information at the exact time needed by a policy. For instance, you could train an agent where one environment is an interactive ImageNet search engine with no reward and the other environment is a classification challenge with delayed decisions allowed (but still regularized to encourage fast response). Giving the policy the ability to pause and search related images would make it more human like and ideally more accurate. I'm sure you can imagine other scenerios where the multi-environment paradigm is beneficial. (Just consider the computational beenfit of only needing to deploy a single large model to interact with dozens of consenting clients.)

**Greatest advantage**: Perhaps the greatest benefit of multi-environment learning is that we can use this paradigm to train otherwise-standard RL agents to *learn to adapt and generalize in context*. In *parallel randomized domain learning*, we might train our agent to explore different variations of the same procedurally generated environment simultaneously. In *staggered lifelong learning*, we would present the agent with a cirricula of environments which do not all have the same start and end time. Of course, these kinds of techniques would require a *large set of environments or even procedural environment generators*. These environments/procedural generators would need to be extremely diverse, so I'm just going to gather them by hand. Soon I hope to have an RL agent that can find more for me.