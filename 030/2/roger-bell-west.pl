#!/usr/bin/env perl
use v5.36;

my $target=12;

foreach my $a (0..$target) {
  foreach my $b ($a..$target) {
    my $c=$target-$a-$b;
    if ($c>=$b) {
      print "$a $b $c\n";
    }
  }
}
