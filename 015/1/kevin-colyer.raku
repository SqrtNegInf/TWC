#!/usr/bin/env raku

use Test;

my @p =   (2,3,*+2 ... ∞).grep: *.is-prime;

my @weak   = (1 .. ∞).map: { @p[$_]  if @p[$_]  <  ( @p[$_-1] + @p[$_+1] ) /2  };
my @strong = (1 .. ∞).map: { @p[$_]  if @p[$_]  >  ( @p[$_-1] + @p[$_+1] ) /2  };


sub MAIN($num where *>1 = 10)
{
    say "$num weak primes";
    say @weak[^$num];

    say "$num strong primes";
    say @strong[^$num];
}
