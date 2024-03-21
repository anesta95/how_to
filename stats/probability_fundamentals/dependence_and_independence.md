Two events $A$ and $B$ are **independent** if, and only if, $P(A\:and\:B) = P(A) * P(B)$

For example, in the Women's World Cup Semifinals analysts predicted that the probability of Australia beating England was `.043` and the probabiltiy of Spain beating Sweden was `0.60`. Thus, the probability that the World Cup Final would be Australia vs. Spain can be found as:

$P(AUS) * P(ESP) = 0.43 * 0.6 = .258$

This is because we are assuming the probability of each outcome in one match was not affected by knowing the outcome of the other match. This means that the results of the two matches were _independent_.

If events $A$ and $B$ are **dependent**, then:
$P(A\:and\:B) = P(A|B) * P(B)$

So, to find the probability of Australia winning the World Cup, we need to compute:

$P(AUS\:wins\:final\:and\:AUS\:wins\:semifinal) = P(AUS\:wins\:final\:|\:AUS\:wins\:semifinal) * P(AUS\:wins\:semifinal)$

The **law of total probability** expresses the probability of an event as a sum of events that can never happen at the same time:

$P(A) = P(A\:and\:B)+P(A\:and\:not\:B)$

For example, if we've found that the probability that Australia beats Spain in World Cup Final is `0.10` and the probability that Australia beats Sweden in the World Cup Final is `0.08` then the probability that Australia wins the World Cup in general is $0.08 + 0.10 = 0.18$