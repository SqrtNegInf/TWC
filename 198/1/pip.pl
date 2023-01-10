#!/usr/bin/env perl

use strict;use warnings;use utf8;use v5.10; 
#my $d8VS='N14L7YES'; ??
sub MxGp {my @list=@_;my $mgap=0;my $gcou=0;
  print '(' . sprintf("%-7s",join(',',@list)) . ') => ';
  for(1..$#list){
    if   (($list[$_]-$list[$_-1]) >  $mgap){$gcou=1;$mgap=$list[$_]-$list[$_-1];}
    elsif(($list[$_]-$list[$_-1]) == $mgap){$gcou++;}
  } say  $gcou . ';';
  return($gcou);
}
if(@ARGV){
  MxGp(@ARGV);
}else{
  MxGp(2,5,8,1); # => 2;
  MxGp(3      ); # => 0;
  MxGp(1,2,4,7); # => 1;
  MxGp(0,3,6,8); # => 2;
  MxGp(0,2,4,6); # => 3;
}
