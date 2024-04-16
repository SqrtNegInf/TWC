#!/usr/bin/env perl
use strict;
use warnings;

use Test2::V0 -srand => 1;

is(target_array([0, 1, 2, 3, 4], [0, 1, 2, 2, 1]), [0, 4, 1, 3, 2], 'Example 1');
is(target_array([1, 2, 3, 4, 0], [0, 1, 2, 3, 0]), [0, 1, 2, 3, 4], 'Example 2');
is(target_array([1], [0]), [1], 'Example 3');
done_testing();


sub target_array
{
     my ($aref_source, $aref_indices) = @_;
     my @output;
     for my $i ( 0 .. $#$aref_source )
     {
          if ( defined $output[$aref_indices->[$i]] )
          {
               my $this = $output[$aref_indices->[$i]];
               splice(@output, $aref_indices->[$i], 1, $aref_source->[$i], $this);
          }
          else
          {
               $output[$aref_indices->[$i]] = $aref_source->[$i];
          }
     }
     return \@output;
}
