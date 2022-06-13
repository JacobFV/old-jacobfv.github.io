---
layout: page

title: "<code>multi-graph-former</code>"

hidden:
redirect: https://github.com/JacobFV/multi-graph-former
category: [ai]
importance: 7

date: 2020-09-02 #  YYYY-MM-DD, must be specified
start: 2020-09-02
end: 2021-05-16
display_date: # used instead of `date` or date range

img:
github: JacobFV/multi-graph-former # uname/repo, don't include the prefix `https://github.com/`

description: Like a transformer, but for graph2graph instead of seq2seq
bullet_points: | # at least two bullet points
    - Sequences are just a special class of graphs. The multi-graph-former can process any kind of graph.
    - Supports intra- and inter-graph attention, vert updates, and edge updates with dynamic structure
    - Implemented gated-update mechanism for both vertices and edges with einsum-based operations
    - [Example](https://github.com/JacobFV/multi-graph-former/blob/master/multi_graph_former/modules/language_wm_graph_former_test2.py) applies multi-graph-former to  building a graph-structured hidden state for a recurrent neural network that encodes a sequence of words
---
