#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);


use Test::More;
sub set_nulls
{
     my $aref = shift;
     my %rows_null;
     my %cols_null;

     for my $row ( 0 .. $#$aref )
     {
          for my $col ( 0 .. $#{$aref->[$row]} )
          {
               if ( 0 == $aref->[$row][$col] )
               {
                    $rows_null{$row} = undef;
                    $cols_null{$col} = undef;
               }
          }
     }



     for my $row ( 0 .. $#$aref )
     {
          for my $col ( 0 .. $#{$aref->[$row]} ) 
          {
               (exists $rows_null{$row} or exists $cols_null{$col}) 
                    and $aref->[$row][$col] = 0;
          }
     }

     return $aref;
}

is_deeply(set_nulls([[1, 0, 1], [1, 1, 1], [1, 1, 1]]),
                    [[0, 0, 0], [1, 0, 1], [1, 0, 1]], 'Example 1');

is_deeply(set_nulls([[1, 0, 1], [1, 1, 1], [1, 0, 1]]),
                    [[0, 0, 0], [1, 0, 1], [0, 0, 0]], 'Example 2');

is_deeply(set_nulls([[1, 1, 1], [1, 1, 1], [1, 0, 1]]),
                    [[1, 0, 1], [1, 0, 1], [0, 0, 0]], 'Example 3');

done_testing();                    
