#!/usr/bin/env perl
use v5.36;

use List::Util 'max';

sub maximum_gap (@N) {
   return 0 if @N <= 1;
   (my $p, @N) = sort { $a <=> $b } @N;
   return max(map { (my $d, $p) = ($_ - $p, $_); $d } @N);
}

my @input = @ARGV ? @ARGV : (1, 3, 8, 2, 0);
say maximum_gap(@input);
