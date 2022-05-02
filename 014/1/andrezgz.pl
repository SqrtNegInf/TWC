#!/usr/bin/env perl

use strict;
use warnings;

my $upto = $ARGV[0] || 50;

my $n_1 = 0;    #sequence start
my %last;       #last position for each number

print $n_1;
for my $pos (1 .. $upto-1) {

    my $n = exists $last{$n_1} ? $pos - $last{$n_1} : 0;
    print ', '.$n;

    $last{$n_1} = $pos;
    $n_1 = $n;
}
