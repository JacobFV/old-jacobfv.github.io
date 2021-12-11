---
layout: post
title: Estimating the Critical Mass
date: 2021-11-6
description: How close are we to matching the computational metrics of the brain?
hidden: true
---

I'm sure somebody has made these kinds of analyses in much greater detail, but I wanted to get a sense of the computational limits that we are presently at. Many of the numbers are pulled out of the internet without serious effort; others are (explicitly) made-up.

## Energy efficiency

At its developed peak, the brain might have 200 trillion synapses and consume 1760 kJ/day. Making this a ratio, we get 200 trillion synapses / 20W = 10 trillion synapses / watt. Suppose 1 synapse performs at least 10 'operations' per second. Then the brain performs at least 100 TFLOPS with an ideal efficiency exceeding 100 TFLOPS/watt. Compare this to machine computation:

- [This paper (fig 5)](https://arxiv.org/pdf/1911.11313.pdf) says that in 2020, GPUs reach 100 GFLOPS/watt. However it notes that energy efficiency is exponentially increasing (rough estimate, 10x every 10 years)
- The v3-32 TPU Pod delivers ~1680 TFLOPS (see below) with [estimated power consumption](https://www.nextplatform.com/2018/05/10/tearing-apart-googles-tpu-3-0-ai-coprocessor/) 200W/core\*32cores = 6.4kW. This makes about 250GFLOPS/watt. Only about 3 orders of magnitude less than this brain estimate.

## Compute cost

Suppose it costs $10/day to sustain a human brain. Using the above measures, then the brain can perform at least 2000 trillion operations per second using only $0.0001... for a single second. This makes 17280000 TFLOP/$ or 17 exaflops per dollar. The v3-32 TPU Pod ideally approaches 4 times the single 8 core TPU performance = 4 \* 420TFLOPS = 1680TFLOPS at a price $10,512 / month or $0.00400219298 per second. This makes 1680TFLOP/$0.00400219298 or 419769 operations per $ or about 0.5MFLOP/$. digital compute infrastructure looks on the order of 10^18 times less efficient than neuronal computation.

## Raw Compute

The 100 TFLOPS brain estimate looks rather small.
