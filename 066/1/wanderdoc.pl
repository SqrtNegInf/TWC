#!/usr/bin/env perl
use v5.36;

sub floor_division
{
     my ($m, $n) = @_;
     die "Division by 0$/" if 0 == $n;
     return 0 if 0 == $m;
     
     my $sign = 1;
     if ( $m < 0 ) { $sign = 0 - $sign; }
     if ( $n < 0 ) { $sign = 0 - $sign; }
     
     $m = abs($m);
     $n = abs($n);


     my $counter = 0;
     while ( $m > $n )
     {

          $m -= $n;
          $counter++;
     }
     return 1 == $sign ? $counter : 0 - $counter;

}

use Test::More;

is(floor_division( 5,  2),  2, ' 5 /  2');
is(floor_division(-5,  2), -2, '-5 /  2');
is(floor_division(-5, -2),  2, '-5 / -2');
is(floor_division(10,  3),  3, '10 /  3');
is(floor_division(17, -2), -8, '17 / -2');


done_testing();
