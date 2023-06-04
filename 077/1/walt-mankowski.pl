#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum);
use Algorithm::Combinatorics qw(subsets);

sub fibs_upto($n) {
    if ($n == 1) {
        return (1);
    } else {
        my @fibs = (1,2);
        while (1) {
            my $next = $fibs[-2] + $fibs[-1];
            if ($next <= $n) {
                push @fibs, $next;
            } else {
                return @fibs;
            }
        }
    }
}

my $n = 377;
my @fibs = fibs_upto($n);
my $iter = subsets(\@fibs);
my $found = 0;
while (my $p = $iter->next) {
    next unless $p->@*;
    local $, = ' + ';
    if (sum($p->@*) == $n) {
        say $p->@*;
        $found = 1;
    }
}

say 0 unless $found;

