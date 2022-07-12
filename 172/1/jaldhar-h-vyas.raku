#!/usr/bin/env raku

sub MAIN(
    Int $m = 38, #= an integer to partition
    Int $n =  2  #= number of elements in partition
) {
    my @primes = (1 .. $m).grep({ .is-prime });
    my $count = 0;

    for @primes.combinations($n) -> @combo {
        if ([+] @combo) == $m {
            @combo.join(q{, }).say;
            $count++;
        }
    }

    unless $count {
        say "No such prime partition.";
    }
}
