---
layout: post
title:  Dev Platforms
date:   2020-06-01
description: Various potential 'incubators' for AGI.
---


## General

- https://openai.com/resources/ This includes Microscope which lets you view the attention patterns of a convolutional neural network.

## Reinforcement Learning

### Agents
- [OpenAI Baselines](https://github.com/openai/baseline): "OpenAI Baselines is a set of high-quality implementations of reinforcement learning algorithms." Check out [implementations](https://github.com/openai/baselines/network/dependents?package_id=UGFja2FnZS01MDIzMjE5Mw%3D%3D).
- [plan2explore](https://github.com/ramanans1/plan2explore)

### Frameworks
- [Nengo](nengo.ai) Large scale cognitive brain modeling toolkit. Several publications [here](https://www.nengo.ai/publications/) including a good [introduction to nengo](http://compneuro.uwaterloo.ca/files/publications/bekolay.2014.pdf)
- [tdw](https://github.com/threedworld-mit/tdw/) Plenty of examples in the repository including dynamic crowd simulation.
  > ThreeDWorld (TDW) is a platform for interactive multi-modal physical simulation. With TDW, users can simulate high-fidelity sensory data and physical interactions between mobile agents and objects in a wide variety of rich 3D environments.
- gym
- [Acme](https://github.com/deepmind/acme)
  > Acme is a library of reinforcement learning (RL) agents and agent building blocks. Acme strives to expose simple, efficient, and readable agents, that serve both as reference implementations of popular algorithms and as strong baselines, while still providing enough flexibility to do novel research. The design of Acme also attempts to provide multiple points of entry to the RL problem at differing levels of complexity.


### Environments
- [Physically Embedded Planning Problems: New Challenges for Reinforcement Learning](https://arxiv.org/abs/2009.05524)
  - instead of directly playing board games, you have to learn to move your robotic joints to play. This is much more dificult.

- [Control Suite](https://github.com/deepmind/dm_control)  
  > The DeepMind Control Suite is a set of continuous control tasks with a standardised structure and interpretable rewards, intended to serve as performance benchmarks for reinforcement learning agents. The tasks are written in Python and powered by the MuJoCo physics engine, making them easy to use and modify. (https://arxiv.org/abs/1801.00690)
- Behavior Suite [(bsuite)](https://github.com/deepmind/bsuite)
  > `bsuite` is a collection of carefully-designed experiments
that investigate core capabilities of reinforcement learning (RL) agents with
two objectives. First, to collect clear, informative and scalable problems
that capture key issues in the design of general and efficient learning algorithms. Second, to study agent behaviour through their performance
on these shared benchmarks. (https://arxiv.org/abs/1908.03568)
- Arcade Learning Environment ([ALE](https://github.com/mgbellemare/Arcade-Learning-Environment)): Automatically benchmark agents on an array of video games.
  > interface to hundreds of Atari 2600 game environments, each one different, interesting, and designed to be a challenge for human players (https://jair.org/index.php/jair/article/view/10819)
- [Super Mario Bros](https://github.com/Kautenja/gym-super-mario-bros)
  > An OpenAI Gym environment for Super Mario Bros. & Super Mario Bros. 2 (Lost Levels) on The Nintendo Entertainment System (NES) using the nes-py emulator.
- [MalmoEnv](https://github.com/Microsoft/malmo/tree/master/MalmoEnv): MalmoEnv is an OpenAI "gym" Python Environment for Malmo/Minecraft, directly implemented Python to Java Minecraft.
- [DeepMind Lab](https://github.com/deepmind/lab) "is a 3D learning environment based on id Software's Quake III Arena via ioquake3 and other open source software"
- [Open AI Gym Environments](https://github.com/openai/gym/blob/master/docs/environments.md)
- [Open Spiel](https://github.com/deepmind/open_spiel)
- [Presentation and Analysis of a Multimodal Dataset for Grounded LanguageLearning](https://arxiv.org/abs/2007.14987)
