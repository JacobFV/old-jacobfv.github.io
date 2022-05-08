---
layout: page

title: "<code>Computatrum</code>"

hidden:
redirect:
category: [ai]
importance: 1


date: 2019-02-01 # YYYY-MM-DD, must be specified
start: 2019-02-01
end:
display_date: # used instead of `date` or date range

img:
github: # uname/repo, don't include the prefix `https://github.com/`

description: It's time for AI grow up
bullet_points: | # at least two bullet points
  - ambitious project to build a computer program that can program a computer
  - :construction: Under construction :construction:

bullet_points: >
  <ul>
      <li> Active project to develop teachable yet autonomous open-ended computer interaction agents </li>
  </ul>

github: https://github.com/Limboid/computatrum
redirect: https://github.com/Limboid/computatrum
---

**WORK IN PROGRESS**

Machine learning has a general recipe for developing increasingly advanced systems: we identify and optimize various ‘components of intelligence' (such as datasets, environments, training paradigms, objectives, and architecture designs) and then incrementally integrate them under an iterative dev-test cycle. We do this while minimizing the amount of information movement required (how much data we have to collect, how long we train the model, and how much cognitive load our own mind handles through design and experimentation). The human mind is a powerful at solving machine, but **even at the iteration speed of an expert research team with high end equipment, there are just too many accidental and essential complexities, and not enough automation driving ML evolution from end-to-end**. Now in deep learning, the phrase “end-to-end” means you don’t have to hand-engineer a bunch of parameters, but state-of-the-art deep neural networks today are still relatively hardwired when you consider that they have to be spoon fed datasets, told when to wake up, train, and die, and they train under an economic fitness landscape that they have no direct awareness of. That is why they still employ us as machine learning engineers to tune the remaining 100 hyperparameters as well as the uncountably many unknown parameters. **If machine learning is going to approach and surpass the rate-limiting bar of human research and development, we need to liberate as many aspects of the ML development cycle as possible to autonomous control.**

This motivates developing systems that genuinely propagate feedback from ‘end-to-end’, hunt for their own data, pursues their own cultivated intrinsic motivations, act as their own economic entity subject to the same financial and technological constraints as an independant human engineer, and are able to research and develop state-of-the-art ML systems -- including improvements of themselves. I am not just reformulating autoML, unsupervised/reward-free/intrinsically-motivated reinforcement learning, or some evolutionary AI-generating formal algorithm. **I propose developing a fully autonomous, open-ended machine learning system that which interacts using standard peripherals connected to a virtual machine running Ubuntu with Internet access to interact with robots, research sites, and its own software and compute resources.** I call this system Computatrum. Following is a description of the system’s architecture and the current state of development.

## Design

A computatrum is a family of multiagent network ([MAN](/projects/the-multi-agent-network)) architectures which consist of

- a substrate agent which provides a representation of the state of the environment OS and hardware including information on the CPU, GPU, memory, disk, peripherals, power, key events and mouse position and events.
- one or more computer interation agents for each computer that the computatrum has control over. Computer interaction agents provide computer screen capture video, computer sound capture audio, audio and video stream to a virtual webcam on the computer, keyboard control, mouse control, and a representation of the state of the environment OS and hardware including information on the CPU, GPU, memory, disk, peripherals, power, key events and mouse position and events.
- Zookeeper interface agent: allows any zookeeper client to connect and interact via text, audio, video, reward, and multimodal conversation. **NOTE**: The Zookeeper server is also able to peer into each of the computatrum's child machine environments and recieve and control all the information that the computatrum does (keystrokes/mouse/audio/video/etc).

**Training:** Computatra (pl of Computatrum) train by intrinsic and extrinsic objectives. I plan to collect dozens of unsupervised/intrinsically motivated reinforcement learning algorithms and train them online. I also plan to use programming tasks with performance normalized by the compute cost as a benchmark to administer reward.
