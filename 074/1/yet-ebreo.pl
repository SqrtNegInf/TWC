#!/usr/bin/env perl
use strict;
use feature 'say';

my @list = (1, 2, 2, 3, 2, 4, 2);
my %h;

$h{$_}++ for @list;

my $r = (sort { $h{$b}-$h{$a} } keys %h)[0];

print ( ($h{$r}> @list/2) ? $r : -1 )
