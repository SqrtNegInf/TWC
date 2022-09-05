#!/usr/bin/env raku

sub MAIN(
    Str $s  = 'raku Yearly Challenge'
) {
    my %chars;

    for $s.comb.antipairs -> $c {
        if %chars{$c.key}:exists {
            %chars{$c.key} = ∞;
        } else {
            %chars{$c.key} = $c.value;
        }
    }

    say (%chars.sort({ $^a.value <=> $^b.value})).first.value;
}
