The **joint probability** $P(A\:and\:B)$ measures the chance the two events `A` and `B` will happen together.

For example say you had three probabilities of weather and departure status at an airport:

* $P(No\:rain) = 82\%$
* $P(On-time\:and\:no\:rain) = 49\%$
* $P(On-time\:|\:no\:rain) = 59\%$

Multiplying $P(On-time\:|\:no\:rain) = 49\%$ and $P(No\:rain) = 82\%$ together gives us $59\% * 82\% \approx 49\%$ which is the value we found for $P(On-time\:and\:no\:rain) = 49\%$

More precisely:

$P(No\:rain) = \frac{number\:of\:records\:with\:no\:rain}{number\:of\:records}$ and $P(On-time\:|\:no\:rain) = \frac{number\:of\:on-time\:flights\:with\:no\:rain}{number\:of\:records\:with\:no\:rain}$

Multiplying them together cancels the $number\:of\:records\:with\:no\:rain$ terms leaving us with $\frac{number\:of\:on-time\:flights\:with\:no\:rain}{number\:of\:records}$. This is the joint probability $P(On-time\:and\:no\:rain)$

This relationship between probabilities holds generally – joint and conditional probabilties are connected through: $\text{P(A \textbf{and} B) = P(A|B) * P(B)}$

Generally, when event `A` depends on whether or not event `B` happens, $P(A)$ is a mixture of $P(A|B)$ and $P(A|not\:B)$:

$\text{P(A) = P(A|B) * P(B) + P(A|\textbf{not} B) * P(\textbf{not} B)}$

This **Law of Total Probability** lets us update our probabilties when filtering isn't an option