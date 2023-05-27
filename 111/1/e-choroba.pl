#!/usr/bin/env perl
use v5.36;

sub search_matrix_hash {
    my ($matrix, $value) = @_;
    my %values;
    @values{ map @$_, @$matrix } = ();
    return exists $values{$value} ? 1 : 0
}

sub search_matrix_bin {
    my ($matrix, $value) = @_;
    my ($y0, $y1) = (0, $#$matrix);

    while ($y0 < $y1) {
        my $y = int(($y0 + $y1) / 2);
        if ($matrix->[$y][0] > $value) {
            $y1 = $y - 1;
        } elsif ($matrix->[$y][-1] < $value) {
            $y0 = $y + 1;
        } else {
            $y1 = $y;
        }
    }
    return 0 if $y1 < $y0;

    my ($x0, $x1) = (0, $#{ $matrix->[$y0] });
    while ($x0 < $x1) {
        my $x = int(($x0 + $x1) / 2);
        if ($matrix->[$y0][$x] > $value) {
            $x1 = $x - 1;

        } elsif ($matrix->[$y0][$x] < $value) {
            $x0 = $x + 1;

        } else {
            $x1 = $x;
        }
    }
    return 0 if $x1 < $x0;

    return $matrix->[$y0][$x0] == $value ? 1 : 0;
}

my $matrix = [[  1,  2,  3,  5,  7 ],
              [  9, 11, 15, 19, 20 ],
              [ 23, 24, 25, 29, 31 ],
              [ 32, 33, 39, 40, 42 ],
              [ 45, 47, 48, 49, 50 ]];

use Test::More tests => 2;

is search_matrix_hash($matrix, 35), 0, 'Missing';
is search_matrix_hash($matrix, 39), 1, 'Found';
