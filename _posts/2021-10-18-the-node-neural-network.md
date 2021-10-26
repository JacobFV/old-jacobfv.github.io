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
- `nnn.nodes.specialized.gym_interface` provides a *source* of energy via reward. Also the standard input and output
- `nnn.nodes.specialized.dataset_interface`
- `nnn.nodes.specialized.video`
- `nnn.nodes.specialized.audio`
- `nnn.nodes.specialized.webcam`
- ...

From the developer perspective, it should be easy to do things like
```python
nnn = NNN(interface=dict(obs=env.obs_spec, act=env.action_spec))
# itegrate with common RL loops
traj = executor.run(nnn, env)
trainier.train(nnn, env, traj)

# itergrate with ML pipelines
nnn = NNN(example=ds[0])
nnn.fit(ds, epochs=10)
nnn.evaluate(ds)

# make cool NNN's quickly
nnn = NNN(nodes=dict(
    bert=nnn.nodes.specialized.bert,
    gpt3=nnn.nodes.specialized.gpt3,
    reward=nnn.nodes.specialized.gym_interface(myenv),
    webcam=nnn.nodes.specialized.webcam,
    somp0=nnn.nodes.common.somp.SOMP(),
    somp1=nnn.nodes.common.somp.SOMP(),
    somp2=nnn.nodes.common.somp.SOMP(),
    somp3=nnn.nodes.common.somp.SOMP(),
    compute_energy=nnn.nodes.common.compute_energy.ComputeEnergyEstimator(),
    ), connections=[
        ('gpt3:input', 'somp1:input'),
        ...
    ], grow=True)

state = nnn.reset()
for _ in range(10):
    state = nnn.step(state)
    NNN.visualize_state(state)

# add a new modality to the NNN
nnn.add_node(nnn.nodes.specialized.audio.Audio(), 'audio')

nnn.save('my_nnn.pkl')
nnn.show_graph()
nnn.save_model('my_model.savedmodel')  # may not allow for future growth. Just a compiled single iteration cell.

nnn = NNN.load('my_nnn.pkl')
```
