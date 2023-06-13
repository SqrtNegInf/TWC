#!/usr/bin/env perl
use v5.36;

use 5.030;
use strict;
use warnings;

my @rooms = (0) x 501;

for my $emp (1..500) {
  for (my $room = $emp; $room <= 500; $room += $emp) {
    $rooms[$room] ^= 1;
  }
}

say 'Open: ', join ',', grep { $rooms[$_] } 1..$#rooms;
