#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum);
use List::MoreUtils qw(pairwise);

my @list1 = (1, 2, 3);
my @list2 = (4, 5, 6);

say sum ( pairwise { $a * $b } @list1, @list2 );
