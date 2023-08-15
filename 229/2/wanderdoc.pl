#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;

sub are_in_at_least_n
{
     my $n = shift ; # $_[0];
     my @aoa = @_;
     my %count;
     for my $aref ( @aoa )
     {
          my ($ref_nr) = $aref . '';

          for my $elm ( @$aref )
          {
               $count{$elm}{$ref_nr} = undef;
          }
     }


     my @output = sort { $a <=> $b }
          grep { scalar keys %{$count{$_}} >= $n } keys %count;
     return @output;
}

is([are_in_at_least_n(2, [1, 1, 2, 4], [2, 4], [4])], [2, 4], 'Example 1');
is([are_in_at_least_n(2, [4, 1], [2, 4], [1, 2])], [1, 2, 4], 'Example 2');
is([are_in_at_least_n(3, [1 .. 9], [7 .. 20], [5 .. 10], [18 .. 25], [17 .. 19])], [7, 8, 9, 18, 19], 'Example 3');


done_testing();
