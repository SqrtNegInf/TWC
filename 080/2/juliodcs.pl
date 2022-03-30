#!/usr/bin/env perl
use strict;
use warnings;
use experimental 'signatures';
use List::Util qw(all);
use feature 'say';

my @ARGV = (1, 4, 3, 2);

die "Only numbers accepted\n" unless all { m/^\d+$/ } @ARGV;

say @ARGV + grep { $ARGV[$_] ne $ARGV[$_ + 1] } 0 .. @ARGV - 2;
