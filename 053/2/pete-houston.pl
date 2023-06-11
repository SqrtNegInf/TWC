#!/usr/bin/env perl
use v5.36;
use strict;
use warnings;
use feature 'say';

my %rules = (
    a => [qw/e i/],
    e => [qw/i/],
    i => [qw/a e o u/],
    o => [qw/a u/],
    u => [qw/o e/]
);

my $n = 3;
die "1 <= N <= 5 is the restriction.\n" unless $n > 0 && $n < 6;

next_str ($_) for sort keys %rules;

sub next_str {
    my $string = shift;
    return say $string if length $string == $n;
    for my $c (@{$rules{substr ($string, -1, 1)}}) {
        next_str ("$string$c");
    }
}
