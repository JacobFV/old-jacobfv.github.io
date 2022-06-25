---
layout: page

title: "The Multi-Agent Network (aka: the <code>MAN</code>)"

hidden: false
redirect: https://github.com/Limboid/man
category: [ai]
importance: 4

date: 2021-10-01 #  YYYY-MM-DD, must be specified
start: 2021-10-01
end:
display_date: # used instead of `date` or date range

img:
github: Limboid/man # uname/repo, don't include the prefix `https://github.com/`
under_construction: true

description: A modular developer-oriented framework for integrating pretrained and learning agents
bullet_points: | # at least two bullet points
    - A modular developer-oriented framework for integrating pretrained and learning agents
---

TODO: separate this content into a blog post and the github repository

The challenge is fusing them all togethor:

- We already have reasonably well performing modality-specific architectures (VGG, BERT, WaveNet), but no general vision, language, audio architecture.
- We have foundation models (gpt3, ViT), but where are the foundation policies?
- What's the most efficient way to shuttle information from dataset to model?

I prpose developing a modular system to address these challanges: the _Multi Agent Network (MAN)_. The following is a declarative description of what I intend to make:

The Multi Agent Network is an iterative update deep learning architecture composed of a network of _agents_ that read and write data to _variables_ (like `salina`). Variables have an owner (agent name), local name, type, value, and gradient (optional).

**Learning**: Learning can be local to the agent:

- connection formation/growth/prunning
- agent binary fision and agent death
- agent internal parameter updates
  Learning can also be coordinated by variables with a `reward` type.The `man` library includes a compute energy estimation function.

**Optional Computation**: No signal -- even input signals -- except energy is required to be present. The MAN is a sparse self-gated network of experts and agent outputs are not applied to their output variables if `None`.

**Agents** may be specialized or common. Common agents share a sparse activation distribution which facilitates open-ended growth. Common agents include:

- PredAgent
- SORNAgent
- SOMPAgent
- ...

Specialized agents represent a (part of a) specific ML model. Their ports must be specifically labeled corresponding to the expected flow of information. `man` includes:

- `man.agents.specialized.bert`
- `man.agents.specialized.gpt3`
- `man.agents.specialized.vit`
- `man.agents.specialized.wavenet`
- `man.agents.specialized.xlm`
- `man.agents.specialized.triple_graph` can be initialized empty or with DBPedia, Wikidata, other queryable knowledge graphs.
- `man.agents.specialized.gym_interface` provides a _source_ of energy via reward. Also the standard input and output
- `man.agents.specialized.dataset_interface`
- `man.agents.specialized.video`
- `man.agents.specialized.audio`
- `man.agents.specialized.webcam`
- ...

From the developer perspective, it should be easy to do things like

```python
man = MAN(interface=dict(obs=env.obs_spec, act=env.action_spec))
# itegrate with common RL loops
traj = executor.run(man, env)
trainier.train(man, env, traj)

# itergrate with ML pipelines
man = MAN(example=ds[0])
man.fit(ds, epochs=10)
man.evaluate(ds)

# make cool MAN's quickly
man = MAN(agents=dict(
    bert=man.agents.specialized.bert,
    gpt3=man.agents.specialized.gpt3,
    reward=man.agents.specialized.gym_interface(myenv),
    webcam=man.agents.specialized.webcam,
    somp0=man.agents.common.somp.SOMP(),
    somp1=man.agents.common.somp.SOMP(),
    somp2=man.agents.common.somp.SOMP(),
    somp3=man.agents.common.somp.SOMP(),
    compute_energy=man.agents.common.compute_energy.ComputeEnergyEstimator(),
    ), connections=[
        ('gpt3:input', 'somp1:input'),
        ...
    ], grow=True)

state = man.reset()
for _ in range(10):
    state = man.step(state)
    man.visualize_state(state)

# add a new modality to the man
man.add_agent(man.agents.specialized.audio.Audio(), 'audio')

man.save('my_man.pkl')
man.show_graph()
man.save_model('my_model.savedmodel')  # may not allow for future growth. Just a compiled single iteration cell.

man = man.load('my_man.pkl')
```

I need to think about all of this. Here's an idea

```python

workspace = Workspace()
workspace['x'].set(val)
workspace['name.val'].set(val)

agent(workspace)
```

What should I add to `salina`?

1. **allow inspecting the types of the variables in the workspace** This can already be done with a `Workspace`
2. **make it easy to inspect and change the multiagent communication topology (for common agents to grow and prune neighbors)** This can be done by defining `register_child` and `register_parent` functions for the `CommonAgent` base class. Children shouldn't be agnostic to which parent is sending set points on their top outputs anyway.

```python
class CommonAgent(salina.Agent):
    def register_child(self, child):
        self.children.append(child)
    def register_parent(self, parent):
        self.parents.append(parent)
```

3. **provide a convenience initializer to define _common agent_ topologies** Then you combine the common agents with specialized agents.

```python
common_agents = CommonAgents(
    agents=[
        my_common_agent_1,
        SOMP(name='somp0'),
        SORN(name='sorn0'),
        ...
    ],
    connections=[
        ('somp0:top', 'somp1:bottom'),
        (my_common_agent_1.ports.top, 'sorn0')
        ...
    ],
)
```

## New Attempt

A Multi Agent Network `MAN` includes

- a salina `workspace` to store data. allows using salina conventions.
- a list of agents: to track the agents, update them in order, and add/remove ones. users can reach in an wrap a salina `Agents` object around them.
- a timestep variable defined on the workspace: to track the current timestep.
- a `__call__` function that takes any number of keyword arguments and overrides the workspace variables with those values, performs `N_steps` steps, and returns the `return_var_keys` workspace variables for the given timestep. This allows treating a MAN like a regular function and running it through an ML pipeline, env-agent executor, or another MAN.
- a `start` function which runs the workspace until the `stop` function is called (by an agent internally or asynchronously).
- at least one `CommonAgent` in `self.agents`: Common Agents
  - namespace their variables with their name
  - have a device which biases the set of neighbors they gravitate towards connecting with
  - keep track of parents and children internally (see number 2 above)
  - share a sparse representation language where 0 is equivalent to `None`
  - share a common variable interpretation for `reward`, TODO
  - reproduce (split into two commonagents), die (autopoeisis), and mutate (train)
- at least one `RewardAgent` in `self.agents` to distribute credit to other reward agents and common agents.
- any number of other agents in `self.agents`: such as internal datasets, replay buffers, state estimators, triple graph query agents, etc.

`CommonAgent`'s

## New Attempt

The Multi Agent Network (MAN) extends salina with an **executor** and **common agents**.

An executor

- contains a workspace and agents
- helps you schedule updates on particular subsets of agents
  - indefinitely
  - alternating periodic
  - update condition for each agent
- provides a feedforeward wrapper to update the workspace variable for the current timestep

Common agents

- keep track of, connect, and prune their lateral neighbors, parents, and children
- reproduce, train, and die
- share a sparse representation language where 0 is equivalent to `None`
- share a common dataflow interpretation for `bottom`, `side`, and `top` (not all agents use all these variables)
- namescope their variables and only operate on other name-scoped variables

The executor also passes itself into the call function for agents that are common agents. The common agent can then look at All of the agents in the executors agent pool to see if it wants to form parent-child connections. The agent makes parent child connections by calling the dot at parent function on its child and calling the dot add child function on itself

You have the search for your own parents and children
parentname:top > selfname:side? > selfname:top
childname:bottomgrad:selfname > self:bottomgrad:parentname
