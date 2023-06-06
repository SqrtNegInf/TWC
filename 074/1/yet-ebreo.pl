#!/usr/bin/env perl
use v5.36;

my @list = (1, 2, 2, 3, 2, 4, 2);
my %h;

$h{$_}++ for @list;

my $r = (sort { $h{$b}-$h{$a} } keys %h)[0];

say $h{$r} > @list/2 ? $r : -1;
