#!/usr/bin/env perl

use v5.36;

sub DpaM {my @nums = sort { $a <=> $b } @_;my @dpam = ();my %hasn = ();
  for (0..$#nums-1) {
    if ($nums[$_] == $nums[$_+1]) {
      push(@dpam,    $nums[$_  ]      ); last;
    }
  }
  for (0..$#nums  ) {       $hasn{$nums[$_]} = 1; }
  for (0..$#nums  ) {
    if  (  @dpam && !exists($hasn{$_+1})) {
      push(@dpam,                 $_+1); last;
    }
  }
  printf(                "(%-7s) => ", join(',', @nums));
  if    (@dpam) { printf("(%s);\n",    join(',', @dpam)); }
  else          { say      "-1;"; }
  return(@dpam);
}
if    (@ARGV) {
  DpaM(@ARGV);
} else {
  DpaM(1,2,2,4); # => (2,3);
  DpaM(1,2,3,4); # => -1   ;
  DpaM(1,2,3,3); # => (3,4);
}
