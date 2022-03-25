#!/usr/bin/env raku

sub MAIN(Int $n = 70) {
    my @divisors = (1 ..^ $n).grep({ $n %% $_; });

    if ([+] @divisors) <= $n {
        say 0;
        exit;
    }

    for @divisors.combinations -> $combo {
        if ([+] $combo) == $n {
            say 0;
            exit;
        }
    }

    say 1;
}
