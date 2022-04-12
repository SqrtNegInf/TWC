#!/usr/bin/env perl

use strict;
use warnings;

foreach my $n (55, 743) {
  my $t=$n;
  while (1) {
    if ($t =~ /^[01]+$/) {
      print "$t\n";
      last;
    } else {
      $t+=$n;
    }
  }
}
