#!/usr/bin/env perl
use v5.36.0;
use strict;use warnings;use utf8;
sub Mono {my @nums=@_;my $frsf=0;my $monf=1;my $strt=1;
  $strt++ while (@nums && $strt < $#nums && $nums[$strt-1] == $nums[$strt]);
  if  (@nums   >     1) { $frsf= ($nums[$strt-1] > $nums[$strt]) ? -1 : 1; }
  for ($strt..$#nums-1) {
    if (($frsf == -1 && $nums[$_] < $nums[$_+1]) ||
        ($frsf ==  1 && $nums[$_] > $nums[$_+1])) { $monf=0;last; } }
  print '(' . sprintf("%-7s",join(',',@nums)) . ') => ';
  say    $monf . ';';
  return($monf);
}
if    (@ARGV) {
  Mono(@ARGV);
} else {
  Mono(1,2,2,3); # => 1
  Mono(1,3,2  ); # => 0
  Mono(6,5,5,4); # => 1
}
