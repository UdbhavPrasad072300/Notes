# Lecture 3: Neural Networks

<hr>

## Course Info

Website Link: http://web.stanford.edu/class/cs224n/index.html

Video Link: https://www.youtube.com/watch?v=8CWyBNX6eDo&list=PLoROMvodv4rOhcuXMZkNm7j3fVwBBY42z&index=3&ab_channel=stanfordonline

<hr>

## Classification Intuition

Classify data into a set of classes.

Softmax turns it into a probability distribution.

With binary classification we can get away with one output layer

When training with softmax and cross-entropy loss, our objective is to maximize the probability of the correct class y; 
or we can minimize the negative log probability of that class:

<img src="./images/lecture3-1.JPG">

## Cross Entropy

Concept of "Cross Entropy" comes from information theory

<img src="./images/lecture3-2.JPG">

## Neural Networks

Linearity is not enough; neural networks can learn much more complex functions and nonlinear decision boundaries

Neural Networks a quite different from statistical approach to ML

