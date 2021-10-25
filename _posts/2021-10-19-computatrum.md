---
layout: post
title:  Computatrum
date:   2021-10-19
description: Teachable yet autonomous open-ended computer interaction agents 
---

**WORK IN PROGRESS**

Machine learning has a general recipe for developing increasingly advanced systems: we identify and optimize various ‘components of intelligence' (such as datasets, environments, training paradigms, objectives, and architecture designs) and then incrementally integrate them under an iterative dev-test cycle. We do this while minimizing the amount of information movement required (how much data we have to collect, how long we train the model, and how much cognitive load our own mind handles through design and experimentation). The human mind is a powerful at solving machine, but **even at the iteration speed of an expert research team with high end equipment, there are just too many accidental and essential complexities, and not enough automation driving ML evolution from end-to-end**. Now in deep learning, the phrase “end-to-end” means you don’t have to hand-engineer a bunch of parameters, but state-of-the-art deep neural networks today are still relatively hardwired when you consider that they have to be spoon fed datasets, told when to wake up, train, and die, and they train under an economic fitness landscape that they have no direct awareness of. That is why they still employ us as machine learning engineers to tune the remaining 100 hyperparameters as well as the uncountably many unknown parameters. **If machine learning is going to approach and surpass the rate-limiting bar of human research and development, we need to liberate as many aspects of the ML development cycle as possible to autonomous control.** 

This motivates developing systems that genuinely propagate feedback from ‘end-to-end’, hunt for their own data, pursues their own cultivated intrinsic motivations, act as their own economic entity subject to the same financial and technological constraints as an independant human engineer, and are able to research and develop state-of-the-art ML systems -- including improvements of themselves. I am not just reformulating autoML, unsupervised/reward-free/intrinsically-motivated reinforcement learning, or some evolutionary AI-generating formal algorithm. **I propose developing a fully autonomous, open-ended machine learning system that which interacts using standard peripherals connected to a virtual machine running Ubuntu with Internet access to interact with robots, research sites, and its own software and compute resources.** I call this system Computatrum. Following is a description of the system’s architecture and the current state of development.

## Core

### `computatrum-controller-py`
The python library that runs the controller model. Transmits data using `launchpad` which allows the controller to run locally or remotely. Performs multiparadigm learning on each foreward pass. Utilizes a growing node neural network with the default modalities: 
    - reward: `reward:from_parent` (reinforcing signal), `reward:to_children`
    - text: `text:from_parent`, `text:to_parent`, `text:from_children`, `text:to_children`
    - video: `video:from_parent`, `video:to_parent`, `video:from_computer`, `video:to_computer`
    - audio: `audio:from_parent`, `audio:to_parent`, `audio:from_computer`, `audio:to_computer`
    - other: `motor:computer`, `touch:computer`
    - recurrent: `recurrent_state`

### `computatrum-environment-py`
Server running on the machine that the computatrum interacts with. Uses VNC internally to transmit video `video:computer` and mouse and key `motor:computer` events. `touch:computer` represents the state of the OS, CPU processor cores, GPU, memory, and disk.  

Sends to computatrum-py:
- `text:from_children`: Any text recieved from UDP TEXT_TO_PARENT_PORT.
- `video:from_computer`: Video from the Xorg display (via VNC)
- `audio:from_computer`: OS Internal audio
- `touch:computer`: representation of the state of the OS and hardware including information on the CPU, GPU, memory, disk, peripherals, power, key events and mouse position and events.  

Recieves from computatrum-py:
- `reward:to_children`: Reward signal to be broadcast on UDP REWARD_TO_CHILDREN_PORT.
- `text:to_children`: Text to be broadcast on UDP TEXT_TO_CHILDREN_PORT.
- `video:to_computer`: Video to stream to virtual webcam
- `audio:to_computer`: Audio to stream to virtual microphone
- `motor:computer`: Mouse and keyboard events to perform in the OS environment (via VNC)

### `computatrum-py`
Python library that binds the controller and the environment together into an autonomous system. Also manages saving weights, zookeeping interface logic, and provides a CLI. Server-agnostic (HTTP API vs. managed controller makes no difference).

## computatrum.io
- Introduces humans to this system: general public, addresses AI-safety misconceptions, how to use Computatrum
- Facilitates research and development: tutorials, documentation, code, and weights
- Provides fully managed / serverless controller API / environment hosting. For the controller API, users can have the recurrent state stored on the cloud. For fully managed computatra, permissions to read/write information may be federated. 
- Provides a home for the base Computatrum family who are viewable publicly on the Zookeeper dashboard. The community can also vote to shutdown individual computatra.

### Computatrum Zookeeper
- React /native app: mobile, web, desktop
- Users launch, hibernate, and shutdown computatra
- Connects to remote computatra. On desktop, can also manage local computatra.
- Presents realtime hidden state, reward, and other modality inputs and outputs
- Computatrum information can be saved and rewatched later. Zookeeper maintains a user-determined rolling history of data to retrospectively capture.
- Users can interact via `audio:parent`, `video:parent`, `text:parent`, and `reward:parent` modalities
- 


, observe, interact with computatra and record, annotate, and share information about the computatrum's family tree, saved weight checkpoints, 
- Users can also 
- For the online-connected version, access to specific information may be federated. For the local-connected version, lists the local computatra. 
    


Computatrum is an infrastructure for Intelligence. Think Internet 5.0. 

node neural network hyper-regularized to scale gracefully and regularized for minimal complexity (like a polynomial model that puts increasing regularization strength on higher order coefficients and so it only scales to more complex models when necesary)

nodes can be local or they can be microservices exposed by other networks. (The NNN builds on existing open source multi-device abstractions)

A decentralized pool of weights and nodes are open sourced and can be used by anyone. independant subnetworks currently communicate over the internet, but they may utilize other mechanisms in the future.

Will include
- computer interaction modalities (i.e.: mouse, keyboard, screen, audio, camera, etc.) for action and perception of unstructured data (i.e.: image search, wikipedia, twitter, etc.) 
- graph interaction modalities for leveraging structured data (i.e.: DBPedia, Freebase, personal db, etc.) This will not be heavily emphasized when critical NN's take off.

Sizes of subnetworks can be arbitrarily large. I will develop three:
computatrum-100M
computatrum-1B
computatrum-10B

All independant subnetworks
- are independant economic agents
- heavily interface with computers
- conform to the API (+graph interaction)
- are under scrutiny

clarify names for:
- global network
- independant subnetworks
- the NNN's that underlie independant subnetworks