#!/usr/bin/env perl
use v5.36;

sub center {
    my $max_size = 0;
    for my $str (@_) {
        my $length = length $str;
        $max_size = $length if $length > $max_size;
    }
    map { " " x (int ($max_size - length) / 2) . $_} @_;
}

my @strings = ("This", "is", "a test of the", "center function");
say for center @strings;
