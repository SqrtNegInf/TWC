#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

use List::Util qw(max);
use Test2::V0 -srand => 1;

is(max_pos_neg(-3, 1, 2, -1, 3, -2, 4), 4, 'Example 1');
is(max_pos_neg(-1, -2, -3, 1), 3, 'Example 2');
is(max_pos_neg(1, 2), 2, 'Example 3');
done_testing();


sub max_pos_neg
{
     my @arr = @_;
     my $pos = my $neg = '';
     for my $int ( @arr )
     {
          if    ( $int > 0 ) { vec($pos, $int, 1) = 1;     }
          elsif ( $int < 0 ) { vec($neg, abs($int), 1) = 1;}
     }
     return max (unpack("%32b*", $pos), unpack("%32b*", $neg));
}
