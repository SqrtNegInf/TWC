#!/usr/bin/env perl
use v5.36;

use Time::Piece;
use Time::Seconds;

my $START = "01.01.2000";
my $STOP  = "12.31.2999";
my $INPUT_FORMAT = "%m.%d.%Y";

my $t1 = Time::Piece->strptime($START, $INPUT_FORMAT);
my $t2 = Time::Piece->strptime($STOP , $INPUT_FORMAT);

my $counter;


while ( $t1 <= $t2  )
{
      # Bypass the invalide months ( += ONE_YEAR would be wrong!):
     ((reverse $t1->yy) + 0) > 12 and 
          $t1 = Time::Piece->strptime("12.31." . $t1->year , $INPUT_FORMAT);
     my $output_mdy = $t1->mdy('');
     print join("\t", ++$counter, $output_mdy), $/ 
          if $output_mdy eq reverse $output_mdy;
     $t1 += ONE_DAY;
}
