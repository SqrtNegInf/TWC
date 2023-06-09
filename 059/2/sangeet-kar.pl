#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum);
use Algorithm::Combinatorics qw(combinations);

my @ARGV = (2,3,4);

sub helper {
    my ( $a, $b ) = @_;
    sum( split //, sprintf ("%b", $a ^ $b ));
}

sub bitsum {
    sum map {helper @$_} combinations \@ARGV, 2
}

print bitsum;
