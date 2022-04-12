#!/usr/bin/env raku

multi sub MAIN(Int $num = 55) {
    my $multiple =
        ($num, $num + $num ... ∞).grep({ $_.Str ~~ / ^ <[01]>+ $ /; })[0];
    say $num, ' x ', $multiple / $num, ' = ', $multiple;
}
