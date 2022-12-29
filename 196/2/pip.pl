#!/usr/bin/env perl

use strict;use warnings;use utf8;use v5.10;

sub NumR {my @iary=@_;my $mult=0;my @oary=();my $i=0; # Last week, I treated output comments as to be printed.
  print '(' . sprintf("%-15s",join(',',@iary)) . ') => '; # This week, I just print input.
  while  ($i < $#iary){my $strt=$i;
    while($i < $#iary  && $iary[$i+1] == ($iary[$i] + 1)){$i++;}
    if($strt != $i){
      print ', ' if($mult);
      print "[$iary[$strt],$iary[$i]]";$mult=1;push(@oary,[$iary[$strt],$iary[$i]]);
    } $i++;
  } say ";";
  return(@oary);
}
if(@ARGV){
  NumR(@ARGV);
}else{
  NumR(1,3,4,5,7);
  NumR(1,2,3,6,7,9);
  NumR(0,1,2,4,5,6,8,9);
}
