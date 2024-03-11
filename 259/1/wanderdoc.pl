#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

use Time::Piece;
use Time::Seconds;
use Test2::V0 -srand => 1;

is(days_offset('2018-06-28', 3, ['2018-07-03']), '2018-07-04', 'Example 1');
is(days_offset('2018-06-28', 3                ), '2018-07-03', 'Example 2');
done_testing();


sub days_offset
{
     my $start_day = $_[0];
     my $offset = $_[1];
     my $bank_holidays_aref = $_[2];
     my %bank_holidays;
     my $date_format = "%Y-%m-%d";
     
     @bank_holidays{ map Time::Piece->strptime($_, $date_format), @{$bank_holidays_aref}} = undef;
      
     my $date_ts = Time::Piece->strptime($start_day, $date_format);
     my $counter = 0;
     while ( $counter < $offset )
     {
          $date_ts += ONE_DAY;
          $counter++;

          if ( exists $bank_holidays{$date_ts}  
               or $date_ts->day_of_week == 0 # Sunday
               or $date_ts->day_of_week == 6 # Saturday
          )
          {
               $counter--;
          }
     }
     return $date_ts->ymd('-');
}
