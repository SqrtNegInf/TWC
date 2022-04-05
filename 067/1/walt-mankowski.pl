#!/usr/bin/env perl
use strict;
use warnings;
use feature qw(:5.32);
use experimental qw(signatures);
use Algorithm::Combinatorics qw(combinations);

my ($m, $n) = (5,3);;

my @data = 1..$m;
my @combs;
my $iter = combinations(\@data, $n);
while (my $p = $iter->next) {
    push @combs, sprintf('[%s]', join(',', $p->@*));
}
say '[ ', join(", ", @combs), ' ]';
