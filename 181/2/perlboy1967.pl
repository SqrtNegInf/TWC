#!/usr/bin/env perl

use v5.16;
#use warnings;

use File::Slurp;
use List::MoreUtils qw(slide);

sub hotDay ($) {
  no warnings 'once';
  slide{$$a[1]<$$b[1]?$$b[0]:()}map{[split/,/]}sort(read_file($_[0]));
}

say join "\n", hotDay(shift // 'temperature.txt');
