#!/usr/bin/env raku

sub MAIN(
    @alphanumstr = ('perl', 2, 'r4ku')
) {
    my $maxvalue = -∞;

    for @alphanumstr -> $str {
        my $value = ($str ~~ /^ \d+ $/) ?? $str.base(10) !! $str.chars;
        if $value > $maxvalue {
            $maxvalue = $value;
        }
    }

    say $maxvalue;
}
