#!/usr/bin/env raku

sub MAIN($input = 'a1c1e1 abcdef') {
    my $letter = "a";
    for $input.comb() -> $current {
        if ($current ~~ /^\d$/) {
            print chr(ord($letter) + $current);
        } else {
            print $current;
            $letter = $current;
        }
    }
    say "";
}
