#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

use Test2::V0 -srand => 1;

sub flip_matrix
{
     my $mtr = $_[0];
     for my $row ( @{$mtr} )
     {
          @{$row} = reverse @{$row};
          @{$row} = map { abs($_ -= 1) } @{$row};
     }
     return $mtr;
}


is(flip_matrix( [[1, 1, 0], [1, 0, 1], [0, 0, 0]] ),
     [[1, 0, 0], [0, 1, 0], [1, 1, 1]], 'Example 1');
is(flip_matrix( [[1, 1, 0, 0], [1, 0, 0, 1], [0, 1, 1, 1], [1, 0, 1, 0]] ),
     [[1, 1, 0, 0], [0, 1, 1, 0], [0, 0, 0, 1], [1, 0, 1, 0]], 'Example 2');
done_testing();
