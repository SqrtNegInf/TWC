#!/usr/bin/env perl
use v5.36;

use strict;
use warnings;

use List::Util qw( reduce );

my @examples = (
     [0, 1, 2, 3, 4, 5, 6, 7, 8],
     [1024, 512, 256, 128, 64]
    );

for (@examples) {
    say "***||***";
    my @derefed_array = @$_;
    say "input: " . join ", ", @derefed_array;
    my @sorted_array = sort_binary_ones( @derefed_array );
    say "output: " . join ", ", @sorted_array;
}

sub sort_binary_ones ( @input ) {
    # convert each integer to a binary string
    my @bins = map { sprintf "%b", $_ } @input;
    # sum up the value of each binary string
    my @bin_sums = map { reduce { $a + $b } 0, split(//, $_) } @bins;

    # make a list of tuples of type ( binary sum, integer value )
    my @tuple_list = ();
    for (0..scalar(@bin_sums) - 1) {
	push @tuple_list, ([ $bin_sums[$_], $input[$_]]);
    }

    # sort tuple list, first on binary sum, then on integer value
    my @sorted_list = sort { ${$a}[0] <=> ${$b}[0] || ${$a}[1] <=> ${$b}[1] } @tuple_list;

    # return a list of the integer values from the sorted list
    return map { ${$_}[1] } @sorted_list;
}

