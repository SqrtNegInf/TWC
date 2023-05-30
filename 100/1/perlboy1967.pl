#!/usr/bin/env perl
use v5.36;

@ARGV = ('05:15 pm', '19:15', '12:01', '0:05', '2:03AM')
  unless scalar(@ARGV);

foreach my $time (@ARGV) {
  printf "Input: '%s'\n", $time;

  # 'One liner' ;-)
  $time =~ s#\A(\d+)(:\d+)\s*(AM|PM)?\Z#sprintf('%02d%s%s',$1%12+(!$3?($1%12?0:12):uc($3)eq'PM'?12:0),$2,$3?'':$1<12?' AM':' PM')#ie;

  printf "Output: '%s'\n\n", $time;
}
