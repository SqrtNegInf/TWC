#!/usr/bin/env perl
use v5.36;

sub main {
    my $number = shift;

    # Turn the value into a binary string
    my $bin = sprintf '%b', $number;

    say $bin eq reverse($bin) ? 1 : 0;
}

main(99);
