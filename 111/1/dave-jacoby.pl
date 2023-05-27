#!/usr/bin/env perl
use v5.36;

my $matrix = [
    [ 1,  2,  3,  5,  7 ],
    [ 9,  11, 15, 19, 20 ],
    [ 23, 24, 25, 29, 31 ],
    [ 32, 33, 39, 40, 42 ],
    [ 45, 47, 48, 49, 50 ],
];
my $input1 = 35;
my $input2 = 39;

say uc 'are these correct?';
say join "\t", '', '0', $input1, is_in_matrix_0( $matrix, $input1 );
say join "\t", '', '0', $input2, is_in_matrix_0( $matrix, $input2 );
say join "\t", '', '1', $input1, is_in_matrix_1( $matrix, $input1 );
say join "\t", '', '1', $input2, is_in_matrix_1( $matrix, $input2 );
say join "\t", '', '2', $input1, is_in_matrix_2( $matrix, $input1 );
say join "\t", '', '2', $input2, is_in_matrix_2( $matrix, $input2 );
say join "\t", '', '3', $input1, is_in_matrix_3( $matrix, $input1 );
say join "\t", '', '3', $input2, is_in_matrix_3( $matrix, $input2 );
say '';

# the SECOND WORST way: check everything unless/until
# we find a match
sub is_in_matrix_0 ( $matrix, $input ) {
    my $hash = {};
    for my $row ( $matrix->@* ) {
        for my $v ( $row->@* ) {
            return 1 if $v == $input;
        }
    }
    return 0;
}

# the WORST way: put it all into a hash and check the hash
sub is_in_matrix_1 ( $matrix, $input ) {
    my $hash = {};
    for my $row ( $matrix->@* ) {
        for my $v ( $row->@* ) {
            $hash->{$v}++;
        }
    }
    return $hash->{$input} ? 1 : 0;
}

# SLIGHTLY less bad: the same but *memoized*
sub is_in_matrix_2 ( $matrix, $input ) {
    state $hash = {};
    if ( !defined $hash->{ $matrix->[-1][-1] } ) {
        for my $row ( $matrix->@* ) {
            for my $v ( $row->@* ) { $hash->{$v}++; }
        }
    }
    return $hash->{$input} ? 1 : 0;
}

# Checking every row to see if the value is within range
# and THEN checking if it's in that row
sub is_in_matrix_3 ( $matrix, $input ) {
    for my $row ( $matrix->@* ) {
        if ( $input > $row->[0] && $input < $row->[-1] ) {
            for my $v ( $row->@* ) { return 1 if $v == $input; }
        }
    }
    return 0;
}
