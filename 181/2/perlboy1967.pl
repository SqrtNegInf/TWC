#!/usr/bin/env perl

=pod

The Weekly Challenge - 181
 - https://theweeklychallenge.org/blog/perl-weekly-challenge-181/#TASK2

Author: Niels 'PerlBoy' van Dijke

Task 2: Hot Day
Submitted by: Mohammad S Anwar

You are given file with daily temperature record in random order.

Write a script to find out days hotter than previous day.

Credits: Some input from James Curtis-Smith' solution was used
(the '()' part in slide())

=cut

use v5.16;
use warnings;

use File::Slurp;
use List::MoreUtils qw(slide);

sub hotDay ($) {
  no warnings 'once';
  slide{$$a[1]<$$b[1]?$$b[0]:()}map{[split/,/]}sort(read_file($_[0]));
}

say join "\n", hotDay(shift // 'temperature.txt');
