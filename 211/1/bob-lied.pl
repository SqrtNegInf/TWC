#!/usr/bin/env perl

use v5.36;

no warnings "experimental::builtin";
use builtin qw(true false);

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();exit;

sub checkDiagonal($matrix, $N, $M, $r, $c)
{
    my $first = $matrix->[$r][$c];
    while ( ++$r <= $N && ++$c <= $M )
    {
        return false if $matrix->[$r][$c] != $first;
    }
    return true;
}

# This solution checks every diagonal.
sub isToeplitz_A($matrix)
{
    my $maxRow = $matrix->$#*;
    my $maxCol = $matrix->[0]->$#*;

    # Trivially true for n X 1 or 1 X m
    return true if $maxRow == 0  ||  $maxCol == 0;

    # Diagonals from the left edge.  Bottom left corner can be skipped
    for my $left ( 0 .. $maxRow-1 )
    {
        return false unless checkDiagonal($matrix, $maxRow, $maxCol, $left, 0);
    }

    # Diagonals from the top row. We already did main diagonal, and 
    # we can skip the top right corner.
    for my $top ( 1 .. $maxCol-1 )
    {
        return false unless checkDiagonal($matrix, $maxRow, $maxCol, 0, $top);
    }
    return true;
}

# If a matrix is Toeplitz, then every internal element of the matrix will
# be equal to its upper left and lower right neighbor.  Slightly more efficient.
sub isToeplitz($matrix)
{
    my $maxRow = $matrix->$#*;
    my $maxCol = $matrix->[0]->$#*;

    for ( my $r = 1 ; $r <= $maxRow ; $r++ )
    {
        for ( my $c = 1 ; $c <= $maxCol ; $c++ )
        {
            my $val = $matrix->[$r][$c];
            return false if $matrix->[$r-1][$c-1] != $val;
        }
    }
    return true;
}

sub runTest
{
    use Test2::V0;
    no warnings "experimental::builtin";
    use builtin qw(true false);

    my @matrix;
    @matrix = ( [4, 3, 2, 1],
                [5, 4, 3, 2],
                [6, 5, 4, 3], );
    is( isToeplitz(\@matrix), true, "Example 1");

    @matrix = ( [1, 2, 3],
                [3, 2, 1], );
    is( isToeplitz(\@matrix), false, "Example 2");

    @matrix = ( [1, 2, 3] );
    is( isToeplitz(\@matrix), true, "One row");

    @matrix = ( [1], [2], [3] );
    is( isToeplitz(\@matrix), true, "One column");

    done_testing;
}
