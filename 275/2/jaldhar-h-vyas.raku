#!/usr/bin/env raku

sub MAIN(
    Str $str  = 'a1c1e1 abcdef',
 ) {
    my @input = $str.comb;
    my $output;
    my $current;

    for @input -> $c {
        if $c ~~ /\d/ {
            $output ~= chr($current.ord + $c);
        } else {
            $current = $c;
            $output ~= $c;
        }
    }

    say $output;
}
