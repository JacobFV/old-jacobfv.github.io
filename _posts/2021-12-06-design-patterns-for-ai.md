---
layout: post
title: Design Patterns for AI
date: 2021-12-06
description: We need to transfer existing design patterns as far down the stack as possible.
---

Engineering generally starts off with a few high-level abstract ambitions that are refined and translated with increasing clarity into physical realizations. In software engineering, the outputs of this process are unambiguous executable statements. Of course, the whole process is iterative with loops of increasing frequency over the project lifespan and tools automating this optimization (compiler chains, code optimization, high-level languages) operating at progressively higher-levels further reducing the idea to implementation transit time. When neural networks are the focus of software engineering, translation from informal to unambiguous specification is almost immediate (given sufficient understanding of programming, math, deep learning, and thermodynamics) and the brunt of effort shifts (as it rightly should) to actually testing deep learning hypotheses. In the problem space of 'human-level' or 'general' intelligence, this demands attempting to consolidate as many ideas in neuroscience, cognitive psychology, and artificial intelligence as possible into a working system implementation. While this consolidation appears deceptively simple in literature, the constituent ideas are often lost in implementation[^1]. Therefore, I explicitly list several **unverified hypotheses** below to help explicitly keep in mind desired cognitive dynamics of increasingly general intelligence.

TODO: list all my ideas here. citations are allowed, but focus on getting ideas out.

- Definite (e.g.: boolean) logic is inconsistent. Thermodynamics governs the mind; not logic. Logical thought only emerges as a dissipating low-entropy trajectory.[^2]

- Differentiation evolves representations from vague to crisp culminating in perceptions and actions. Actions (thought words, decisions, motor activity) may modify the world state and destroy their causal crisp representation thus restarting the process.[^2]

- Synthesis integrates bottom up signals into composite models. Layer units activate if both a top-down model predicts their activation and a bottom-up signal initiates it. Top-down models compete to 'explain' a signal and sharpen their precision (cognitive niche) when correctly explained. They gradually loosen their precision if they cannot explain a bottom up signal field. If no sharp models explain a bottom up signal, then imprecise general models become competitive. I think model-signal similarity should be measured by $KL[p_{bu} || \tau_{td}]$ which heavily taxes precise models that get selected when they predict low probabilities but true signals have high probabilities. Only the winning model gets optimized by the signal. Loosing models increase their variances.[^2]

- The Gaussian may only represent a small amount of data distributions, but deviations from an estimated and actual distribution are always Gaussian. Also variances. I'm not sure about higher0order moments.

- Dynamic precision training: start training at 32bit, shrink to 1bit for most pre-training, fine-tune back at 32bit. With 1bit networks at criticality, the network gets the maximum computational power out of its physical substrate, and critical dynamics should translate these gains into learnable logical flexibility. Maybe just stay at 1bit.

- If using 1bit representations, maybe have each unit transmit a vector at a time.

- Sparse connectivity is essential, but some local dense connectivity may complement it.

- Look beyond statics to focus on system dynamics. Forget feedforward solutions.

- Integration -- which is not directly solvable like differentiation -- represents tremendous complexity reduction. Try to integrate this behavior into the system dynamics perhaps with a differentiable form of Risch's algorithm.

- Use the log-form of geometric mean to allow networks to selectively multiply or add incoming weights.

- Regularize synchronization and low entropy into the dynamics to favor system-II-type distributed trajectory emergence.

- Design the system to generate minimal activity at each realization level: minimal distributed trajectories, minimal activations, minimal structural connections.

- Prediction and reward maximization may supply the bulk of training information. However include maybe 10% data from more structured forms like task-specific probes and decoders as well as intrinsic behavioral objective satisfaction.

At the implementation-end, machine learning research has acquired a diverse array of tools and techniques which represent orders-of-magnitude learning efficiency gains over independent effort. Ever striving to maximize the efficiency with which meaningful information can be infused into a system recommends riding on the energy-momentum of hundreds of thousands of researchers (and zillions of servers). I.E.: incorporating permutations of as many ML research outcomes as possible: codebases, pretrained models, individual weights, architectures, training paradigms, existing datasets, and environments all guided by machine and human intuition. Here are some notable ones:

TODO: list everything I plan to use here

-

[^1]: I know all the cuts to make before I enter the shop, but sawing for 2 hours leaves me exhausted and I end up incorrectly measuring or cutting material unless things are marked correctly.
[^2]: ["Neurodynamics of Cognition and Consciousness"](https://link.springer.com/book/10.1007/978-3-540-73267-9) ch.1, 5
