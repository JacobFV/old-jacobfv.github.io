---
layout: post
title:  The Artificial Experience
date:   2021-10-10
description: A highly general dataset-env
categories: [ai, computatrum, code, ideas]
tags:   [agi]
---

Our implicit objective in the hypothetical artificial general intelligence is to identify as many dimensions of variation to the underlying data structures that real Intelligence operates on and iterate development around that data. For datasets includes:
- domain: natural language, vision, audio, robot, etc.
- data structure: structured, text, image, video, audio, graph, etc., multimodal
- data representation: discrete, continuous, categorical, binary, etc.
- problem: classification, regression, clustering, autoencoding, autoregression, etc., no specified problem type.
- data augmentations.

For environments we might consider:
- simulated/real
- data representation: discrete, continuous, categorical, binary, etc.
- single objective/multi-objective/no-objective
- partially/fully observable
- markovian/non-markovian
- single agent/multi-agent
- for multi-agent: cooperative/competitive/mixed-mode

I've listed several datasets and environments in the bottom of this post. Ideally, we should train increasingly general ML systems over all of these variations. Still, our training pipelines are very brittle.

I propose developing a tool that allows ML praticioners to easily train their agents across many datasets and environments: the Artificial Experience (`ae`). `ae` should provide minially necesary extensions to extend existing open-source dataset loaders, environments, and hubs. It should be agnostic to the actual training paradigm and tricks (augmentations, experience replay, cirriculum learning, etc.) but itegrate cleanly with tools that do. The following is a declarative description of what I plan to make:

The ArtificialExperience environment (`AEEnv`) provides a wrapper for multiple environments. Datasets may be wrapped into environments. Turn-based multiagent environments are wrapped into parallel agent cycles environments (you can unwrap this later in your multiagent executor). An AEEnv might look like this:
```python
env = AEEnv(envs=[
    DatasetEnv(tfds.load('coco')), # multimodal information
    DatasetEnv(hub.load('hub://activeloop/mnist-train'))  # cloud-native data
    DatasetEnv(tfds.load('anli'), epochs=4, batch_size=1024), # quick customization
    gym.make('CartPole-v0'), # continous observation, discrete control
    gym.make('Pong-v0'), # rgb image, discrete actions
    gym.make('HalfCheetah-v2'), # continuous observation, continuous control
    gym_starcraft.envs.starcraft_base_env(), # starcraft env
    pettingzoo.atari.mario_bros_v2.env() # multiagent atari env
])
```

`AEEnv` also makes it easy to train on prespecified problem domains with datasets and environments minimally specified by some overlapping hierarchial tag-based system. Not all environments have the `.tag` attribute, so those will be ignored. However, the inbuilt list of envionrments should all support this schema. These filters can be changed at any moment between `AEEnv` steps. See Appendix A for a list of what I want to support.
```python
env = AEEnv(
    include=['domain:text-commonsense', 'domain:image', 'domain:multiagent'],
    exclude=['domain:reward-free-rl', 'domain:multiagent/atari', 'test:True'],
) # train on text-commonsense (specific), image datasets (broad), and multiagent RL environments (broad) but don't train on the multiagent/atari environment or multiagent environments that don't have a environment specified reward.

env = AEEnv() # train on all inbuilt datasets and environments
```

A `next_env_fn(last_step_data: step, curr_env: env, available_envs: List[env]) -> env` determines which environment to sample from at *each* timestep. This may be a simple 'wait until all done's are true' (for datasets, after all epochs) or it may be a more complex user-designed autocirricula system. An `env_transition_fn(old_env: env, new_env: env) -> NoReturn` can be specified to make surface-level model changes when the environment (and hence its interface) changes.
```python
# samples a different environment *at every step*. Simple way to train on a diverse lot of datasets within the same problem domain (like images).
next_env_fn = lambda last_step_data, curr_env, available_envs: random.choice(available_envs) 
env.next_env_fn = next_env_fn  # lazy next_env_fn specification

# samples a different environment *after every epoch*. Traditional approach to multi-dataset training.
def next_env_fn(last_step_data: step, curr_env: env, available_envs: List[env]) -> env: 
    if all(last_step_data[agent_name].done for agent_name in curr_env.agent_names):
    random.choice(available_envs) 
    else:
        return curr_env
env = AEEnv(..., next_env_fn=next_env_fn)  # early next_env_fn specification

# builds a new input and output layer for new environments
def env_transition_fn(old_env: env, new_env: env) -> NoReturn:
    if ae.utils.nest.all(
        lambda x, y: x==y, 
        x=[old_env.action_space, old_env.observation_space],
        y=[new_env.action_space, new_env.observation_space]):
        # the environments are compatible, no need to change the model
        return
    else:
        # the environments are incompatible, we need to change the model
        build_new_input_layer(new_env.observation_space)
        build_new_output_layer(new_env.action_space)
        return
env.env_transition_fn = env_transition_fn  # lazy env_transition_fn specification

# builds a new input and output layer for new environments
def env_transition_fn(old_env: env, new_env: env) -> NoReturn:
    if isinstance(old_env, DatasetEnv) and isinstance(new_env, DatasetEnv):
        # the environments are either both datasets or both regular environments, no need to change the model
        return
    else:
        # the environments are incompatible, we need to change the training pipeline
        change_training_pipeline(new_env)
        return
env = AEEnv(..., env_transition_fn=env_transition_fn)  # early env_transition_fn specification
```

Data is presented at each step as an agent-separated dictionary of namedtuple `Step`'s as well as meta information about the environment state (or dataset index). A `Step` is a nested batch of `observation`, `reward`, `done`, and `information` . In most cases, these fields will be `None`. For example, datasets do not provide a reward (reward is determined by the training pipeline which is not part of `AEEnv`).For supervised learning datasets, the observations include both X and Y while for unsupervised learning datasets, the observations include only X. Also, most datasets and environments will only present information for a single agent. Here are some examples:
```python
def evalLoop(agents, env):
    print(env.is_supervised)

    step = env.reset()
    while not all(last_step_data[agent].done for agent in env.agents):
        actions = {
            agent_name: agent.act(step[agent_name].observation) 
            for agent_name in env.agent_names
        }

        step = env.step(actions)

        for agent in env.agent_names:
            print(step[agent].observation)
            print(step[agent].reward)
            print(step[agent].done)
            print(step[agent].information)
```

There's a lot more I don't have time to explain about my plans. Please keep on the lookout for updates: [https://github.com/JacobFV/artificial-experience](https://github.com/JacobFV/artificial-experience).

<!--
## Appendix A: Datasets and environments

The categories overlap. For instance, image captioning might be in the `image` category, but also in the `text` category. The high-level hierarchy might be:
- images
- text
- video
- audio
TODO

### NLP
from Google's [FLAN blog post](https://ai.googleblog.com/2021/10/introducing-flan-more-generalizable.html): 
- Natural language inference: ANLI, RTE, CB, SNLI, MNLI, QNLI, WNLI, QNLI, 
- Commonsense: CoPA, HeliaSwag, PiQA, StoryCloze
- Sentiment: IMDB, Sent140, SST-2, Yelp
- Paraphrase: MRPC, QQP, PAWS, STS-B
- Closed book QA: ARC (easy/chal), NQ, TQA
- Struct to Text: CommonGen, DART, E2ENLG, WEBNLG
- Reading Comp: 
- Reading Comp w/o commonsensne:
- Conference:
- Misc.:
- Summarization:
- Translation:

### Images

### Video

### 

## Appendix B: Utilities

I provide these utilities to make it as simple as possible to integrate `AEEnv` with other libraries.

```
ae.env.trainsition_fns
ae.env.next_env_fns

ae.trainers.{SAC,RAINBOW,}
ae.executers.{simple,multiagent,}
ae.baselines.

ae.utils.nest.{map,flatten,unflatten,all,any,}
```
-->
