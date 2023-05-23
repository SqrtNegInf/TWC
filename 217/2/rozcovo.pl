#!/usr/bin/env perl
use v5.36;

my @list = (31, 2, 4, 10);
say join('', sort { $b cmp $a } @list);
