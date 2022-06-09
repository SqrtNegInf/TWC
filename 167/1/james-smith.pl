#!/usr/bin/env perl

use strict;

use warnings;
use feature qw(say);
use Math::Prime::Util qw(next_prime is_prime);

my($p,$N,$t,@res) = (1,19);

# Cannot raise $N above 10 as the 11th value is:
#   1,111,111,111,111,111,111
# which is 5.5 trillion times larger than the 10th value...

while(@res<$N) {
  ( ( $t = $p = next_prime $p ) < 10
    || $p !~ /[024568]/
    && ( ! grep { !is_prime( $_ )                             && (next)      }
           map  { ( substr$t,0,0,substr$t,-1,1,'' ) || $t < $p ? (next) : $t }
           2 .. length $p )
  ) && ( push @res, $p )
}

say for @res;
