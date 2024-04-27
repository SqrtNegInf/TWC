#!/usr/bin/env perl
use v5.32;
use feature qw(signatures);

#use common::sense;

use Test2::V0 -srand => 1;

use List::AllUtils qw(all);

sub completingWord ($str,$ar) {
  sub sFreq ($s) {
    my %sF; $sF{lc $_}++ for (grep /[a-zA-Z]/, split //, $s);
    return %sF;
  }
 
  my %sFreq = sFreq($str);

  (sort { length($a) <=> length($b) || $a cmp $b } 
     grep { 
       my %f = sFreq($_);
        all { exists $f{$_} and $sFreq{$_} <= $f{$_} } keys %sFreq;
     } @$ar)[0];
}

is([completingWord('aBc 11c',['accbbb','abc','abbc'])],['accbbb'],'Example 1');
is([completingWord('Da2 abc',['abcm','baacd','abaadc'])],['baacd'],'Example 2');
is([completingWord('JB 007',['jj','bb','bjb'])],['bjb'],'Example 3');

done_testing;
