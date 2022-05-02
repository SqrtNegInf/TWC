#!/usr/bin/env raku

my @p = (^Inf).grep: *.is-prime;
my @weak_prime_idx = (^Inf + 1).grep({ 2 * @p[$_] < @p[$_ - 1] + @p[$_ + 1] });
my @strong_prime_idx = (^Inf + 1).grep({ 2 * @p[$_] > @p[$_ - 1] + @p[$_ + 1] });

say "First 10 weak primes:";
@p[@weak_prime_idx[^10]].say;

say "First 10 strong primes:";
@p[@strong_prime_idx[^10]].say;
