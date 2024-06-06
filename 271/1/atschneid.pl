#!/usr/bin/env perl
use v5.36;

use List::Util qw( reduce );

my @examples = (
    [ [0, 1],
      [1, 0] ],
    [ [0, 0, 0],
      [1, 0, 1] ],
    [ [0, 0],
      [1, 1],
      [0, 0] ]
    );

for (@examples) {
    my @derefed_matrix = @$_;
    say( show_matrix( @derefed_matrix ) );

    my $max_row = find_max_earliest_sum( @derefed_matrix );

    # very non-perlishly 1 indexed!?
    ++$max_row;

    say("max row :: $max_row");
}

sub show_matrix (@matrix) {
    return join ",\n",
	map { join ' ', '[', ( join ', ', $_->@* ), ']' } @matrix;
}

sub find_max_earliest_sum ( @matrix ) {
    # map each row of the matrix to the sum of its elements
    my @counts = map { reduce {$a + $b} 0, $_->@* } @matrix;

    # iterate of indices and find the first index of the max element
    my $idx = 0;
    for (0..scalar(@counts) - 1) {
	if ($counts[$_] > $counts[$idx]) {
	    $idx = $_;
	}
    }

    return $idx;
}
