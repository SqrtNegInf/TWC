#!/usr/bin/env raku

my %*SUB-MAIN-OPTS = :named-anywhere;

# mostly doesn't work...

#| Find 2 prime numbers greater than 1 that add up to the target number
sub MAIN (
    UInt $n where * >= 4 = 9, #= Target number (must be 4 or greater)
    Bool :a(:$all) = True #= Print all possible combinations
) {
    my @primes = (2..$n-1).grep(*.is-prime);
    for @primes.reverse -> $large {
        next unless $large + any(@primes) == $n;
        exit if $large < $n / 2;
        for @primes -> $small {
            if $large + $small == $n {
                say "$large + $small = $n";
                exit unless $all;
            }
        }
    }
}
