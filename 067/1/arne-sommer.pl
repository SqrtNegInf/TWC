#!/usr/bin/env perl
use v5.36;

use Algorithm::Combinatorics qw(combinations);

my $m = 5;
my $n = 3;

die "XX" unless int($m) == $m;
die "XX" unless int($n) == $n;

die "XX" unless $m > 0;
die "XX" unless $n > 0;

my @numbers = 1 .. $m;

my @answer;

my $iter = combinations(\@numbers, $n);
while (my $c = $iter->next)
{
  push(@answer, "[" . join(",", @{$c}) . "]");
}

say "[ ", join(", ", @answer), " ]";
