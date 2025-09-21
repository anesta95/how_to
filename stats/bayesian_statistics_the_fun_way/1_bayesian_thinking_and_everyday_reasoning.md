# Reasoning About Strange Experiences
Bayesian reasoning involves stepping through your thought process when you're confronted with a situation to recognize when you're making probabilistic assumptions, and then using those assumptions to update your beliefs about the world. The simplified steps of a Bayesian analysis might boil down to:

1. Observe data
2. Form a hypothesis
3. Update your beliefs based on the data

## Observing Data
In probability theory, we use a comma to separate events when we're looking at the combined probability of multiple events. Using the example of waking up to what seems to be a UFO outside your window:

$P(\text{bright light outside window, saucer-shaped object in the sky}) = \text{very low}$
This can be read as "The probability of observing bright lights outside the window and a saucer-shaped object in the sky is very low."

We can also examine probabilities of single events, which would be written as:
$P(rain) = likely$
and read as "The probability of rain is likely"

For the UFO scenario, we're determining the probability of *both* events occurring *together*.

## Holding Prior Beliefs and Conditioning Probabilities
In a formula, we enter prior beliefs *after* our data, separated with a pipe `|` like so:
```math
P(\text{bright light outside, saucer-shaped object in the sky | experience on Earth}) = very\:low
```
This reads as: "The probability of observing bright lights and a saucer-shaped object in the sky, *given* our experience on Earth, is very low." The probability outcome is called a *conditional probability* because we are *conditioning* the probability of one event occurring on the existence of something else. In this case, we're conditioning the probability of our observation on our prior experience.

We'll assign all of our data to a single variable, $D$. $\text{D = bright light outside window, saucer-shaped object in the sky}$ So from now on when we refer to the probability of set of data, we'll simply say $P(D)$. Likewise using the variable $X$ to represent our prior belief: $\text{X = experience on Earth}$. Now we can write the equation $P(D | X)$ as "The probability of a bright light outside window, saucer-shaped object in the sky given our experience on earth".

### Conditioning on Multiple Beliefs
We can add more than one piece of prior knowledge too, if it is going to significantly affect the probability. For example that it is the evening of July 4th and you live in the United States.
```math
P(\text{bright light outside, saucer-shaped object in the sky | United States residency, July 4th, experience on Earth}) = low
```
This additional prior knowledge might change the conditional probability from "very low" to "low".

### Assuming Prior Beliefs in Practice
In Bayesian analysis, it's essential to keep in mind that our understanding of the world is always conditioned on our prior experience in the world. 

## Forming a Hypothesis
A hypothesis is a model about how the world works that makes a prediction. When we think of hypotheses in Bayesian statistics, we are usually concerned with how well they predict the data we observe. We would define our first hypothesis as:

```math
H_1 = \text{A UFO is in my back yard!}
```

If we think of this situation backward, we might as "If there was a UFO in your back yard, what would you expect to see?" And you might answer, "Bright lights and a saucer-shaped object." Because $H_1$ predicts  the data $D$, when we observe our data given our hypothesis, the probability of the data increases. This is written formally in the equation:

```math
P(D|H_1, X) >> P(D|X)
```

"The probability of seeing bright lights and a saucer-shaped object in the sky, given my belief that this is is a UFO and my prior experience, is much higher (indicated by the double greater-than sign $>>$) than just seeing bright lights and a saucer-shaped object in the sky without explanation. Here we've used the language of probability to demonstrate that our hypothesis explains the data.

## Spotting Hypotheses in Everyday Speech
The key to probabilistic reasoning is to think carefully about how you interpret data, create hypotheses, and change your beliefs, even in an ordinary, everyday scenario. Without $H_1$, you'd be in a state of confusion because you have no explanation for the data you observed.

# Gathering More Evidence and Updating Your Beliefs
Initial hypothesis: $H_1 = \text{A UFO has landed!}$. In isolation, this hypothesis, given your experience, is extremely unlikely: $P(H_1|X) = \text{very, very low})$

When you observed *additional data*, you immediately realized that there's another possible hypothesis — that a movie is being filmed nearby:
```math
H_2 = \text{A film is being made outside your window}
```

In isolation, the probability of this hypothesis is also intuitively very low. Now we just need a way to take our new data into account when changing our beliefs.

# Comparing Hypotheses
Considering alternative hypotheses is the process of comparing multiple theories using the data you have. When you see the wires, film crew, and additional lights outside your window after waking up, you data changes. Your updated data are:
```math
D_{updated} = \text{bright lights, saucer-shaped object, wires, film crew, other lights, etc...}
```
Your first hypothesis, $H_1$, gave you a way to explain your data and end your confusion, but with your additional observations $H_1$ no longer explains the data well. We can write this as:
```math
P(D_{updated}|H_1,X) = \text{very, very low}
```
Your new hypothesis, $H_2$, explains the data much better and is written as follows:
```math
P(D_{updated}|H_2,X) >> P(D_{updated}|H_1,X)
```

The key here is to understand that we're comparing how well each of these hypotheses explains the observed data. This brings us to the true heart of Bayesian analysis: *the test of your beliefs is how well they explain the world*. Mathematically we express this idea as the *ratio* of the two probabilities:

```math
\frac{P(D_{updated}|H_2,X)}{P(D_{updated}|H_1,X)} = large\:number
```

When this ratio is a large number like 1000 it means "$H_2$ explains the data 1000 times better than $H_1$."
# Data Informs Belief; Belief Should Not Inform Data
The only absolute in all these examples is your data. Hypotheses change, you experience in the world $X$ may be different from someone else's, but the data $D$ is shared by all. Consider the following two formulas:
```math
P(D|H,X)
```
"The probability of the data given my hypotheses and experience in the world" or more plainly "How well my beliefs explain what I observe."
But there is a reversal of this, common in everyday thinking, which is:
```
P(H|D,X)
```
Which is read as "The probability of _my beliefs_ or my hypotheses, given the data and my experiences in the world" or "How well what I observe supports what I believe".
Bayesian thinking is about changing your mind and updating how you understand the world. The data we observe is all that is real, so our beliefs ultimately need to shift until they align with the data.

***You should be far more concerned with data changing your beliefs than with ensuring data supports your beliefs, $P(H|D)$***

# Exercises
1. Rewrite the following statements as equations using mathematical notation:
   1. The probability of rain is low: $P(rain) = low$
   2. The probability of rain given that it is cloudy is high: $P(rain|cloudy) = high$
   3. The probability of you having an umbrella given it is raining is much greater than the probability of you have an umbrella in general: $P(umbrella|raining) >> P(umbrella)$
2. Organize the data you observe in the following scenario into a mathematical notation, using the techniques we've covered in this chapter. Then come up with a hypothesis to explain this data.
   1. You come home from work and notice that your front door is open and side window is broken. As you walk inside, you immediately notice your laptop is missing.
   2. $D = \text{front door open, side window broken, laptop missing}$ & $H_1 = \text{home was broken into}$
   3. We can express this as "The probability of seeing all these things, given that you've been robbed as" $P(D|H_1)$
3. Demonstrate how this new information changes your beliefs and come up with a second hypothesis to explain the data, using notation you've learned in this chapter.
   1. A neighborhood child runs up to you and apologizes profusely for accidentally throwing a rock through your window. They claim that they saw the lapto and didn't want it stolen so they oopned hte front door to grab it, and your laptop is safe at their house.
   2. $D_{updated} = \text{front door open, side window broken, laptop missing, child apologizing for rock throwing, child asserting they have your laptop}$ & $H_2 = \text{child broke window and took laptop to prevent theft}$
   3. We can express this sentiment that the probability the data is explained by our second hypothesis is greater than the probability the data is explained by our first hypothesis as $P(D|H_2) >> P(D|H_1)$
   4. And if the above is the case we would expect that 
```math
\frac{P(D_{updated}|H_2,X)}{P(D|H_1,X)} = large\:number
```

