#!/usr/bin/env raku

# not just primes, so incorrect

unit sub MAIN (:c(:$count) = 20);

my $padovan := ( 1, 1, 1, ( * + * + * * 0 ) ... Inf);

say $padovan[^$count].join(", ");
