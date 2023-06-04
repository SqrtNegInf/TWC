#!/usr/bin/env perl
use v5.36;

rotate( [qw(10 20 30 40 50)], 3, 4    ); ## example from challenge
rotate( [qw( 7  4  2  6  3)], 1, 3, 4 ); ## example from challenge

sub rotate {
  my $a = shift;
  ## First parameter is an arrayref containing the values to be rotated
  ## Remaining parameters are the offsets for each rotation

  ## This is a great use of array slicing to achieve what we need
  ## Indexes go from offset -> size-1 & 0 -> offset-1
  ## Perl nicely handles the case where the value to the left of
  ## the double dot is higher than the value to the right

  print "  [@{[ @{$a}[ $_..(@{$a}-1), 0..($_-1) ] ]}]\n" foreach @_;

}
