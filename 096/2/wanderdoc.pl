#!/usr/bin/env perl
use v5.36;

use List::Util qw(min);
use Test::More;

# Wikipedia: https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance
sub LevenshteinDistance 
{
     my ($str_1, $str_2) = @_;
     my $mtr;


     my @first  = split(//,$str_1);
     my @second = split(//,$str_2);


     do { my $ch1 = $_; 
          do { $mtr->[$ch1][$_] = 0 } for 0 .. scalar @second } 
     for 0 .. scalar @first;


     $mtr->[$_][0] = $_ for 0 .. scalar @first; 
     $mtr->[0][$_] = $_ for 0 .. scalar @second;


     for my $i ( 1 .. scalar @first )
     {
          for my $j ( 1 .. scalar @second )
          {
               my $distance = $first[$i-1] eq $second[$j-1] ? 0 : 1;
               $mtr->[$i][$j] = min
                              (
                                   $mtr->[$i-1][$j] + 1, # deletion.

                                   $mtr->[$i][$j - 1] + 1, # insertion.
                                   $mtr->[$i-1][$j-1] + $distance # substitution.
                              );
          }
          
     }
     return $mtr->[-1][-1];
}

is(LevenshteinDistance(qw(kitten sitting)), 3, 'Example 1');
is(LevenshteinDistance(qw(sunday monday)),  2, 'Example 2');
done_testing();
