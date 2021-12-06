---
layout: post
title: Design Patterns for AI
date: 2021-12-06
description: We need to transfer existing design patterns as far down the stack as possible.
---

Engineering generally starts off with a few high-level abstract ambitions that are refined and translated with increasing clarity into physical realizations. In software engineering, the outputs of this process are unambiguous executable statements. Of course, the whole process is iterative with loops of increasing frequency over the project lifespan and tools automating this optimization (compiler chains, code optimization, high-level languages) operating at progressively higher-levels further reducing the idea to implementation transit time. When neural networks are the focus of software engineering, translation from informal to unambiguous specification is almost immediate (given sufficient understanding of programming, math, deep learning, and thermodynamics) and the brunt of effort shifts (as it rightly should) to actually testing deep learning hypotheses. In the problem space of 'human-level' or 'general' intelligence, this demands attempting to consolidate as many ideas in neuroscience, cognitive psychology, and artificial intelligence as possible into a working system implementation. While this consolidation appears deceptively simple in literature, the constituent ideas are often lost in implementation[^1]. Therefore, I explicitly list several below to help keep in mind some desired cognitive dynamics of increasingly general intelligence.

TODO: list all my ideas here. citations are allowed, but focus on getting ideas out.
["Neurodynamics of Cognition and Consciousness"](https://link.springer.com/book/10.1007/978-3-540-73267-9)

At the implementation-end, machine learning research has acquired a diverse array of tools and techniques which represent orders-of-magnitude learning efficiency gains over independent effort. Ever striving to maximize the efficiency with which meaningful information can be infused into a system recommends riding on the energy-momentum of hundreds of thousands of researchers (and zillions of servers). I.E.: incorporating permutations of as many ML research outcomes as possible: pretrained models, individual weights, architectures, training paradigms, existing datasets, and environments all guided by machine and human intuition. Here are some notable ones:

TODO: list everything I plan to use here

- Use neural networks. They are isomorphic to so many computer science concepts allowing reuse of decade of research on graphs (weight matrices can be viewed as an adjacency matrix), MDP's, continuous functions. More formal cognitive dynamics may be regularized into an inner system-II process run by a system-I neural network.

[^1]: I know all the cuts to make before I enter the shop, but sawing for 2 hours leaves me exhausted and I end up incorrectly measuring or cutting material unless things are marked correctly.
