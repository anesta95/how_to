In a **uniform distribution**, the possible outcomes of an experiment – called the **sample space** – are all equally likely.

For example, in a situation where somebody is guessing answers to yes or no questions randomly, the sample space is $\{Y,N\}$. It's always true that the total probability is 1, so $Prob(Y) + Prob(N) = 1$.

Assuming a guesser guesses randomly so the probabilities are uniformly distributed, they can only sum to $1$ if they are each equal to $\frac{1}{2}$.

This idea generalizes to uniform distributions with any number of outcomes. The total probability is always 11 no matter how the possible outcomes are distributed, so if we list the outcomes in the sample space in no particular order, then:

$\text{Prob(1st outcome) + Prob(2nd outcome) + ... + Prob(final outcome) = 1}$

Let's say that the number of possible outcomes is $N(outcomes)$. In a uniform distribution, any outcome is as likely as any other, so

$\text{Prob(any outcome) * N(outcomes) = 1}$ or $\text{Prob(any outcome)} = \frac{1}{N(outcomes)}$

A **hypothesis** is an assumption made before an experiment is done. For example, assuming that a self-described "psychic" is just guessing at answers they provide to yes or no questions. Quzzing said psychic with a list of yes or no questions provides _data_, and that data either **supports** the hypothesis or gives reason to **reject** it.

To test this hypothesis, one needs to know the probability the psychic will answer $n$ consecutive questions correctly to be right about their method of guessing $Y$ and $N$ with equal likelihood. The probability that the psychic guesses the answers to the set of $n$ questions correctly can then be described as $\frac{1}{2^n}$

This function of $n$ decays exponentially, so if psychic did give a long string of correct answers, the hypothesis would look pretty unlikely.  But data can never “prove” or “disprove” this hypothesis. For instance, the psychic could answer correctly for a very long stretch just by random chance, so this doesn't **prove** they has supernatural knowledge. On the other hand, they also could receive messages from beyond this world, but their source may not be right all the time — providing one wrong answer doesn't **disprove** her oracular powers.

In short, **nothing is ever proven** in statistics. Hypotheses are either ruled likely true or likely untrue based on data gathered.

No matter how unlikely an event is, the probability of observing it in some experiment goes up with the number of **trials** you perform — in this case, the number of random people sampled.

Statistical analysis boils down to these steps:

1. Form a **hypothesis**, which is an assumption made before experimentation.
2. Decide on a criterion that rejects the hypothesis if the experimental results are too unlikely.
3. Gather an analyze data, and then reject or don't reject the hypothesis based on the results.

These are the basic steps of **hypothesis testing**.