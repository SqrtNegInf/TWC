#!/usr/bin/env perl
use v5.36;

use List::Util qw(min);

my $s=7;
my $l=2**$s-1;

my $pos=1;
my $seq=4;
while (1) {
  my $p1=$seq-1;
  my $n0=min($p1-$pos,$l-$pos);
  print '0' x $n0;
  $pos+=$n0;
  if ($p1<=$l) {
    print '1';
    $pos++;
  }
  if ($pos>$l) {
    last;
  }
  $seq=nextseq($seq);
}
print "\n";

sub nextseq {
  my $prev=shift;
  my $c=$prev;
  while (1) {
    $c++;
    my $t=$c-1;
    while (1) {
      my $r=int($t/2);
      if ($t % 2 != 0) {
        last;
      }
      $t=$r;
    }
    if ($t % 4 == 3) {
      last;
    }
  }
  return $c;
}
