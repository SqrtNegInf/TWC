#!/usr/bin/env perl
use v5.36;

my @list_of_numbers = ( 10, 4, 1, 8, 12, 3 );
my @set_of_indices = ( 0, 2, 5 );

say "Initial List:\t", join " ", @list_of_numbers;
say "Indices:\t", join " ", @set_of_indices;

my @sub_list = map { $list_of_numbers[$_] } @set_of_indices;
my @sorted_sub_list = sort { $a <=> $b } @sub_list;

# Put sorted values back into list at indices
map { $list_of_numbers[ $set_of_indices[$_] ] = $sorted_sub_list[$_] }
    ( 0 .. ( scalar @set_of_indices - 1 ) );

say "Final List:\t", join " ", @list_of_numbers;
