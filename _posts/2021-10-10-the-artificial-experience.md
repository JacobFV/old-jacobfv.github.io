---
layout: post
title:  The artificial experience
date:   2021-06-18
description: A tool for increasingly general AI
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

I propose developing a tool that allows ML praticioners to easily train their agents across many datasets and environments: the Artificial Experience (`ae`). `ae` should provide minially necesary extensions to extend existing open-source dataset loaders, environments, and hubs. It should be agnostic to the actual training paradigm and tricks (augmentations, experience replay, cirriculum learning, etc.) but itegrate cleanly with tools that do.

`ae` will formalize a dynamic pipeline interface. All datasets are wrapped into environments. Turn-based multiagent environments are wrapped into parallel agent cycles (you can unwrap this later in your multiagent executor). The `ae` **pipeline** follows the environment's transition function, but all dataset elements and most environments' states are uniquely identifiable so they can be reverted to by a user defined priorization or cirriculum **transition_function** (during regular environment execution, the pipeline's transition_function is the same as the environment's transition function). The `ae` pipeline itself can also change the backend dataset or environment according to a user-defined **source_function** and at each observation or element input, the pipeline presents a description of the underlying data structures. It might look something like this:
```python
# TODO
```


## Notable datasets and environments

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

## Images