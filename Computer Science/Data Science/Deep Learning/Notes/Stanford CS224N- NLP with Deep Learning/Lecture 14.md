# Lecture 14: Transformers and Self-Attention

<hr>

## Course Info

Website Link: http://web.stanford.edu/class/cs224n/index.html

Video Link: https://www.youtube.com/watch?v=5vcj8kSwBCY&list=PLoROMvodv4rOhcuXMZkNm7j3fVwBBY42z&index=14&ab_channel=stanfordonline

<hr>

## Learning Representations of Variable Length Data

Deep Learning is all about representation learning

Up till now it has been only RNN (and gated variants: LSTM, GRU)

<img src="./images/lecture14-1.JPG">

RNNs limit parallelization due to its design

You have to fit a fixed size vector into RNN

Conv Sequential Models are parallelized nicely, exploits local dependencies; interaction distance between
positions linear ot logarithmic. Long-distance dependencies require many layers

<b>Why not use attention for representations</b>

<img src="./images/lecture14-2.JPG">

## Self-Attention

Constant "path length" between any two positions

Gating/multiplicative interactions

Trivial to parallelize (per layer)

Can replace sequential computation entirely

Previous Work:
1) Classification & Regression with Self-Attention:
<br> Parikh et al. (2016), Lin et al. (2016)
2) Self-attention with RNNs:
<br> Long et al. (2016), Shao, Gows et al. (2017)
3) Recurrent attention:
<br> Sukhbaatar et al. (2015)
   
## The Transformer

Self-Attention between words is independent of their position; there we add a Positional Encoding for this

<img src="./images/lecture14-3.JPG">
<br>
<img src="./images/lecture14-4.JPG">

You can't pick out different pieces of information from everywhere without multi-headed attention 
(and it can be done parallel)

There are theorems that suggest LSTMs can model any function (did we just invent a way to do SGD?)

