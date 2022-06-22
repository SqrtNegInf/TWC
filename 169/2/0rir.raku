#!/usr/bin/env raku

use Test;
use Prime::Factor;
#use Expect-achilles;

    # Ignore the number's factors, instead check the factors of
    # the factors' counts.  Any one count indicates not powerful.
    # A non-empty set-diff of the counts' factors indicates there
    # are no integer roots.

my constant @achilles = gather for 72 … ∞ {
    my @ct-per-factor = .&prime-factors.Bag.values;
    next if @ct-per-factor.any == 1
                or
            ∅ ≢ [∩] @ct-per-factor.map: *.&prime-factors.Set;
    .&take;
}

sub MAIN( Int $n = 20 ) {
    my $out = "Output\n " ~ @achilles[0 .. $n-1].join( ', ', :skip-empty);
    say $out;
}

