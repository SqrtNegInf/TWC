#!/usr/bin/env perl
use v5.36;

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
