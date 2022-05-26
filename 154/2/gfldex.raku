#!/usr/bin/env raku
# from https://gfldex.wordpress.com/2022/03/01/pushing/

#Using the sequence operator requires a trick though.

my \padovan = 1, 1, 1, * + * + 0 * * … ∞;
my \padovan-prime = padovan.grep(*.is-prime).unique;

say padovan-prime[^10];

# I have to convince it to operate on the 1th and 2nd element of the initial list and then advance by one. For once, math is on my side because with 0 * * I can force a 3rd automatic variable into existence, without having it take part in building the sum. The rest is just filtering out anything that isn’t prime.

# There is another way to skip arguments if we are willing to use a pointy-block.

my \padovan-alt = 1, 1, 1, -> $a, $b, $ { $a + $b } … ∞;
my \padovan-alt-prime = padovan-alt.grep(*.is-prime).unique;
say padovan-alt-prime[^10];

# This is not as clever but looks intentional. It’s probably better that way.
