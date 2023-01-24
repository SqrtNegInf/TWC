#!/usr/bin/env perl

use strict;use warnings;use utf8;use v5.10;my $d8VS='N1HLNEko';
sub ASlc {my @aray=@_;my @slcz;
  print '(' . sprintf("%-7s",join(',',@aray)) . ') => ';
  for    (my     $i=   0;$i < @aray      -2;$i++) {
    if   ( $aray[$i+1]-$aray[$i] == $aray[$i+2]-$aray[$i+1] ) {
      push(@slcz,"($aray[$i],$aray[$i+1],$aray[$i+2])");
      my $msiz=2; # just loop from 3-leaves to longest trunk
      while (@aray > $i+$msiz && $aray[$i+1]-$aray[$i] == $aray[$i+$msiz]-$aray[$i+$msiz-1]) { $msiz++; }
      if ($msiz > 3) {my $slic='(' . $aray[$i];
        for (1..$msiz-1) { $slic .= ',' . $aray[$i+$_]; }
        $slic .= ')';
        push(@slcz,$slic);
      } } }
  if    (@slcz) { say join(', ',@slcz); }
  else          { say '() as no slice found.'; }
  return(@slcz);
}
if    (@ARGV) {
  ASlc(@ARGV);
} else {
  ASlc(1,2,3,4); # => (1,2,3), (1,2,3,4), (2,3,4)
  ASlc(2      ); # => () as no slice found.
}
