#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);


print join(', ', common_factors(12, 18)), $/;
print join(', ', common_factors(18, 23)), $/;
print join(', ', common_factors(1810, 2020)), $/;
sub common_factors
{
     my ($num_1, $num_2) = @_;
     my $gcd = gcd($num_1, $num_2);
     my @factors;


     for my $i ( 1 .. $gcd )
     {
          push @factors, $i unless $gcd % $i;
     }
     return @factors;
}


sub gcd
{

     my ($num_1, $num_2) = @_;


          while ( $num_1 != $num_2 )
          {
               ($num_1, $num_2) = ($num_2, $num_1) if ($num_2 > $num_1);

               ($num_1, $num_2) = ($num_1 - $num_2, $num_2);
          }
     return $num_2;
}
