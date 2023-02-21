#!/usr/bin/env perl
use strict;
use warnings FATAL => 'all';

use Test::More;


is_deeply(ReshapeMatrix([[1, 2], [3,4]], 1, 4), [[1, 2, 3, 4]], 'Test Case 1 Failed.');
is_deeply(ReshapeMatrix([[1, 2, 3], [4, 5, 6]], 3, 2), [[1, 2], [3, 4], [5, 6]], 'Test Case 2 Failed.');
is_deeply(ReshapeMatrix([[1, 2]], 3, 2), 0, 'Test Case 2 Failed.');

sub ReshapeMatrix {
    my ($matrix, $row, $column) = @_;

    my @flatted_matrix  = map {@{$_}} @{$matrix};

    return 0 if $row * $column > scalar(@flatted_matrix);

    my @reshaped_matrix = ();
    my $index = 0;

    for (my $i = 0; $i < $row; $i++) {
        push @reshaped_matrix, [@flatted_matrix[$index..$index+$column-1]];
        $index += $column;
    }

    return \@reshaped_matrix;
}

done_testing();
