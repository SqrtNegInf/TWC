#!/usr/bin/env perl
use v5.36;

use integer;

my @seq=([1,[]]);
my $goal=200;

while (1) {
  my $s=shift @seq;
  if ($s->[0] == $goal) {
    print join(', ',map {['double','add 1']->[$_]} @{$s->[1]}),"\n";
    last;
  }
  push @seq,[$s->[0]*2,[@{$s->[1]},0]];
  push @seq,[$s->[0]+1,[@{$s->[1]},1]];
}
