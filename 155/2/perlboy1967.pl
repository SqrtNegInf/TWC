#!/usr/bin/env perl

use v5.16;

use strict;
use warnings;
use bigint;

# Prototype(s)
sub fibModN($;$);

my (@fibMod,@fModLh,@fModUh);

my $N = shift // 3;

my $i = 0;
do {
  push(@fibMod,fibModN($i++,$N),fibModN($i++,$N));

  # Split fibMod in two halves
  @fModLh = @fibMod[0 .. int($i/2)-1];
  @fModUh = @fibMod[int($i/2) .. $i-1];

  # Compare lower and upper half
} until (join('',@fModLh) eq join('',@fModUh));

printf "%dth Pisano Period: %d (%s)\n",$N,scalar @fModLh,join(',',@fModLh);


sub fibModN($;$) {
  my ($i,$n) = @_;
  state $fN = [0,1];
  $fN->[$i] //= fibModN($i-2) + fibModN($i-1);
  return (defined $n ? $fN->[$i] % $n : $fN->[$i]);
}
