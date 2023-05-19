#!/usr/bin/env perl
use v5.36;

#
# Note that the challenge says we can terminate the process of iterating
# if we have had 500 iterations. We will never hit that: for all numbers
# between 10 and 1000, we either reach a palindrome or exceed 10_000_000
# long before hitting the 500th iteration (11 iterations is the maximum
# amount of iterations we need). So, we just won't bother tracking the
# number of iterations.
#

sub l ($n) {$n >= 10_000_000 ? 1 : $n eq reverse ($n) ? 0 : l ($n + reverse $n)}
say l s/\n//r while <DATA>;

__END__
56
57
59
196
