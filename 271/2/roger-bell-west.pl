#!/usr/bin/env perl

use strict;
use warnings;
use experimental 'signatures';

use Test::More tests => 2;

is_deeply(sortbyonebits([0, 1, 2, 3, 4, 5, 6, 7, 8]), [0, 1, 2, 4, 8, 3, 5, 6, 7], 'example 1');
is_deeply(sortbyonebits([1024, 512, 256, 128, 64]), [64, 128, 256, 512, 1024], 'example 2');

sub popcount64($x0) {
  no warnings 'portable';
  use constant M1  => 0x5555555555555555;
  use constant M2  => 0x3333333333333333;
  use constant M4  => 0x0f0f0f0f0f0f0f0f;
  use constant H01 => 0x0101010101010101;
  my $x = $x0;
  $x -= ($x >> 1) & M1;
  $x = ($x & M2) + (($x >> 2) & M2);
  $x = ($x + ($x >> 4)) & M4;
  return ($x * H01) >> 56;
}

sub sortbyonebits($a) {
  my %c = map {$_ => popcount64($_)} @{$a};
  return [sort {$c{$::a} <=> $c{$::b} || $::a <=> $::b} @{$a}];
}
