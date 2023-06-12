#!/usr/bin/env perl
use v5.36;

my @a=(111,999);

if ($a[0]>$a[1]) {
  @a=($a[1],$a[0]);
}

foreach my $c ($a[0]..$a[1]) {
  my @d=split '',$c;
  my $v=1;
  foreach my $i (0..$#d-1) {
    if ($d[$i]+1 != $d[$i+1]) {
      $v=0;
      last;
    }
  }
  if ($v) {
    print "$c\n";
  }
}
