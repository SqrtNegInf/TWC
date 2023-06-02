#!/usr/bin/env perl
use v5.36;
use strict;
use warnings FATAL => qw(all);

use List::Util qw(min);
use Test::More;



sub find_squares
{
     my $aref = $_[0];

     my $rows = $#$aref;
     my $cols = $#{$aref->[0]};

     my $min = min($rows, $cols);

     my $result = 0;

     for my $r ( 0 .. $rows )
     {
          for my $c ( 0 .. $cols )
          {
               if ( $aref->[$r][$c] )
               {

                    for my $sq ( 1 .. $min )
                    {
                         last if ( $r + $sq > $rows or $c + $sq > $cols);
                         $result += _check_square($aref, $r, $c, $sq); 
                    }
               }

          }

     }
     return $result;
}

sub _check_square
{
     my ($aref, $r, $c, $sq) = @_;
     return ($aref->[$r+$sq][$c] and $aref->[$r][$c+$sq] and $aref->[$r+$sq][$c+$sq]) ? 1 : 0;

}

is(find_squares([[0, 1, 0, 1], [0, 0, 1, 0], [1, 1, 0, 1], [1, 0, 0, 1]]), 1, 'Example 1');
is(find_squares([[1, 1, 0, 1], [1, 1, 0, 0], [0, 1, 1, 1], [1, 0, 1, 1]]), 4, 'Example 2');
is(find_squares([[0, 1, 0, 1], [1, 0, 1, 0], [0, 1, 0, 0], [1, 0, 0, 1]]), 0, 'Example 3');

done_testing();
