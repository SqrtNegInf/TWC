#!/usr/bin/env perl
use v5.36;

use Time::Local;
use POSIX qw(strftime);

foreach my $y (1900..2019) {
  foreach my $m (1,3,5,7,8,10,12) {
    my @d=gmtime(timegm(0,0,0,1,$m-1,$y));
    if ($d[6]==5) {
      print strftime('%B %Y',@d),"\n";
    }
  }
}
