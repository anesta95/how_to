In probability theory, rather than describing beliefs with terms like _very low_ and _high_, we need to assign real numbers to these beliefs. This allows us to create quantitative models of our understanding of the world. In this chapter, we will apply this concept to quantify the probability of an event.

# What is Probability?
Probability is a measurement of hwo strongly we believe things about the world. To really analyze how we develop and change beliefs, we need to define exactly what a probability is by more formally quantifying $P(X)$ — that is, how strongly we believe in $X$.

Probability allows us to extend logic — absolute beliefs with values of true and false — to work with uncertain values between true and false. Computers commonly represetn true as 1 and false as 0, and we can use this model with probability as well. $P(X) = 0$ is the same as assing that $X = false$, and $P(X) = 1$ is the same as $X = true$. Between 0 and 1 we have an infinite range of possible values, with a value of 0.5 meaning that we are completely unsure if something is true or false.

Another important part of logic is _negation_. When we say "not true" we mean false. Likewise saying "not false" means true. We make sure that the probability of $X$ and the negation of the probability of $X$ sum to 1 (in other words, values are either $X$ or $not X$). This is expressed in the following equation
```math
P(X) + \neg P(X) = 1
```

Using this logic, we can always find the negation of $P(X)$ by subtracting it from 1. If $P(X) = 1$, then its negation $1 - P(X)$, must equal 0, and conforming to basic logic rules if $P(X) = 0$, then its negation $1 - P(X) = 1$.

Next we need to use formal methods to calculate our probabilities.

# Calculating Probabilities by Counting Outcomes of Events
The most common way to calculate probability is to count outcomes of events. We have two sets of outcomes that are important.

1. All possible outcomes of an event.
2. The coutn of the outcomes that you are interested in.

Given these two sets of outcomes — ones you're interested in and ones you're not interested in — all we care about is the **ratio of** *outcomes we're interested in* to *the total number of possible outcomes.* 

In the case of flipping a coin, the total count of all possible outcomes is two: heads or tails. In probability theory we use $\Omega$ to indicate ***the set of all events***:

```math
\Omega = \{heads,\:tails\}
```

We want to know $P(heads)$ — the probability of getting a heads in a single coin toss. We look at the _number of outcomes we care about_, 1, and divide by the _total number of possible outcomes_, 2:

```math
\frac{\{heads\}}{\{heads,\:tails\}}
```

For a single coin toss we can see that there is one outcome we care about out of two possible outcomes. So the probability of heads is just:

$P(heads) = \frac{1}{2}$

A tricker question: What is the probability of *getting at least one heads* when we *toss two coins*? Our list of possible events is more complicated; it's not just $\{heads,\:tails\}$ but rather *all possible pairs of heads and tails*:

```math
\Omega = \{(heads,\:heads),(heads,\:tails),(tails,\:tails),(tails,\:heads)\}
```

To figure out the probability of getting at least one heads, we look at how many of our pairs match our condition (of getting at least one heads), which in this case is:
```math
\{(heads,\:heads),(heads,\:tails),(tails,\:heads)\}
```

The set of events we care about has 3 elements, and there are 4 possible pairs we could get. This means that $P(\text{at least one heads})= \frac{3}{4}$.

Solving harder probabiltiy problems of this nature often involves a field of mathematics called _combinatorics_.

# Calculating Probability as Ratios of Beliefs.
Making bets is a practical way that we can express how strongly we hold our beliefs. You believe that the article on the Mandela effect's existence is so unlikely that you'll give your friend $100 if you are wrong and only get $5 from them if you are right. Because we're talking about quantitative values regarding our beliefs, we can start to figure out and exact probability for your belief that there is no Wikipedia article on the Mandela effect.

## Using Odds to Determine Probability
Your friend's hypothesis is that there is an article about the Mandela effect: $H_{article}$ Your have an alternate hypothesis: $H_{no\:article}$.

Your bet expresses how strongly you believe in your hypothesis by giving the _odds_ of the bet. Odds are a common way to represent beliefs as a ratio of how much you would be willing to pay if you were wrong about the outcome of an event to how much you'd want to recieve for beign correct. While odds are commonly expressed as "$m$ to $n$" we can alos view them as a simple ratio: $\frac{m}{n}$. ***There is a direct relationship between odds and probability***.

We can express your bet in terms of odds as "100 to 5". Your odds represent how many times more strongly you believe there _isn't_ an article than you believe that there _is_ an article, $P(H_{no\:article})$, to your friend's belief that there is one $P(H_{article})$, like so:

```math
\frac{P(H_{no\:article})}{P(H_{article})} = \frac{100}{5} = 20
```

From the ratio of these two hypotheses, we can see that your belief in the hypothesis that there is no article is 20 times greater than your belief in your friend's hypothesis. We can use this fact to work out the exact probability for your hypothesis using some high school algebra.

## Solving for the Probabilities
The equation in terms of the probability of your hypothesis:
```math
P(H_{no\:article}) = 20 * P(H_{article})
```
which can be read as: "The probability that there is no article is 20 times greater than the probability that there is an article".

There are only two possibilties: either there is a Wikipedia article on the Mandela effect or there isn't. Because our two hypotheses cover all possibilities, we know that the probability of an _article_ is just 1 minus the probability of _no article_, so we can substitute $P(H_{article})$ with it's value in terms of $P(H_{no\:article})$ in our equation:

```math
P(H_{no\:article}) = 20 * (1 - (P(H_{no\:article})))
```