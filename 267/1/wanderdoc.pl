#!/usr/bin/env perl
use strict;
use warnings;

use Test2::V0 -no_srand => 1;

is(product_sign(-1, -2, -3, -4, 3, 2, 1), 1, 'Example 1');
is(product_sign(1, 2, 0, -2, -1), 0, 'Example 2');
is(product_sign(-1, -1, 1, -1, 2), -1, 'Example 3');
done_testing();



sub product_sign
{
     my @arr = @_;
     my $sign = 1;
     for my $elm ( @arr )
     {
          return 0 if 0 == $elm;
          if    ($elm  > 0 and $sign > 0) { $sign =  1; }
          elsif ($elm  > 0 and $sign < 0) { $sign = -1; }
          elsif ($elm  < 0 and $sign > 0) { $sign = -1; }
          elsif ($elm  < 0 and $sign < 0) { $sign =  1; }
          else {print "Debug: \$sign = $sign and \$elm = $elm$/";}
     }
     return $sign;
}
