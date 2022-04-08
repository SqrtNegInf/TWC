#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

my @numbers = (0, 1, 2, 5);
my $X = 2;
my $Y = 21;

my $string = join(',',@numbers);

my %seen; # To exclude repetitions because of duplicates in the integer list.


for my $i ( 1 .. $X ) # To allow sets with integers > 9.
{
     while ( my $comb = glob "{$string}" x $i )
     {
          $comb *= 1; # Leading zeros.

          next unless length($comb) == $X; 
          

          if ( $comb < $Y )
          {
               print $comb, $/ unless $seen{$comb}++;
          }
     }
}
