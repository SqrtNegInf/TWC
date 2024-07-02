#!/usr/bin/env perl
use v5.36;


MAIN: {
    my $input = 'a1c1e1 abcdef';

    my $letter = "a";
    for my $current (split //, $input) {
        if ($current =~ /^\d$/) {
            print chr(ord($letter) + $current);
        } else {
            print $current;
            $letter = $current;
        }
    }
    say "";
}
