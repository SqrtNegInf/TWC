#!/usr/bin/env perl
use v5.36;

use List::Util qw/min/;

sub min_window {
   my ($a_ref, $s) = @_;

   my @return_array;

   my $pos = 0;
   while (1) {
	   my $last_index = min(scalar @$a_ref-1, $pos+$s);

	   push @return_array, min(@$a_ref[$pos..$last_index]);
	   last if $last_index == scalar(@$a_ref)-1;

	   $pos++;
   }

   return \@return_array;
}


# TESTS

use Test::More;

is_deeply(\min_window([1, 5, 0, 2, 9, 3, 7, 6, 4, 8],3),\[0,0,0,2,3,3,4]);
is_deeply(\min_window([1, 2, 3],4),\[1]);

done_testing;
