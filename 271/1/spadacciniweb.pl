#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum max min);

my $matrix = [[0, 1],
              [1, 0]
             ];
maximum_ones($matrix);

$matrix = [[0, 0, 0],
           [1, 0, 1]
          ];
maximum_ones($matrix);

$matrix = [[0, 0],
           [1, 1],
           [0, 0]
          ];
maximum_ones($matrix);

exit 0;

sub maximum_ones {
    my $matrix = shift;
    my %rows = map { $_ => sum(@{$matrix->[$_]}) }
                 (0..(scalar(@$matrix)-1));
    my $max = max values %rows;
    printf "row %d\n",
        (min map { $rows{$_} == $max ? $_ : () } keys %rows ) + 1;
    return 0;
}
