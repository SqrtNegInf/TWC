#!/usr/bin/env perl
use v5.36.0;

sub WdVl {my @altz=@_;my %valz=();my $wdst=0;my @wdsv=();
  printf "(%-26s) => (", join(', ',@altz);
  for  ( 0..$#altz-1) {my $vwid=0;
    $vwid++ while ($#altz > $_+$vwid && $altz[$_+$vwid] >= $altz[$_+$vwid+1]);
    $vwid++ while ($#altz > $_+$vwid && $altz[$_+$vwid] <= $altz[$_+$vwid+1]);
    if ($vwid >= $wdst) {$wdst=$vwid;push(@{$valz{$wdst}},$_ );}
  } my  $vbgn=shift(@{$valz{$wdst}}); # get leftmost widest valley start index here
  for  ($vbgn..$vbgn+$wdst) {        push(@wdsv,  $altz[  $_]);}
  say join(', ', @wdsv) . ');';
  return(        @wdsv     );
}
if    (@ARGV) {
  WdVl(@ARGV);
} else {
  WdVl(1, 5, 5, 2, 8             ); # => (5, 5, 2, 8);
  WdVl(2, 6, 8, 5                ); # => (2, 6, 8);
  WdVl(9, 8, 13, 13, 2, 2, 15, 17); # => (13, 13, 2, 2, 15, 17);
  WdVl(2, 1, 2, 1, 3             ); # => (2, 1, 2);
  WdVl(1, 3, 3, 2, 1, 2, 3, 3, 2 ); # => (3, 3, 2, 1, 2, 3, 3);
}
