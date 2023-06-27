#!/usr/bin/env perl
use v5.36;

# We will use a simple recursive function.
# The function takes three arguments:
#    - The target number we like to sum to ($target)
#    - The smallest Fibonnaci number we have not tried yet ($this_fib)
#    - The Fibonacci number proceeding the one above. ($prev_fib)
#
# If $this_fib is larger than $target, we have to way to make the target
# number, so we return 0. 
# If $this_fib is equal to $target, we can only make the target in one way,
# so we return 1.
# Else, we recurse. First, we count the number of ways to make
# $target - $this_fib with Fibonnaci numbers larger than $this_fib, then
# we count the number of ways making $target with Fibonnaci numbers larger
# than $this_fib. We return the sum of these counts.
#
# We also cache the results, to reduce the number of recursive calls.
#

sub count;
sub count ($target, $this_fib = 1, $prev_fib = 1) {
      state $cache = {};
      $$cache {$target . $this_fib} //=
          $this_fib >  $target ? 0
        : $this_fib == $target ? 1
        : count ($target - $this_fib, $this_fib + $prev_fib, $this_fib) +
          count ($target,             $this_fib + $prev_fib, $this_fib)
}


say count $_ while <DATA>;

__END__
16
9
15
1234
