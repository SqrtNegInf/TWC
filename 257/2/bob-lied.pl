#!/usr/bin/env perl
use v5.36;
use builtin qw/true false/; no warnings "experimental::builtin";

use List::Util qw/any all/;
use List::MoreUtils qw/first_index/;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

sub rre($m)
{
    my @pivotCol = map { first_index { $_ != 0 } $_->@* } $m->@*;

    # Rows without a pivot should be at the bottom of the matrix.
    my $zeroRow = first_index {$_ == -1} @pivotCol;
    if ( $zeroRow > -1 )
    {
        return false if ( any {$_ != -1} @pivotCol[ $zeroRow .. $#pivotCol ] );

        # Eliminate zero rows from further consideration
        splice(@pivotCol, $zeroRow);
    }

    # All pivots must be 1
    for my $row ( 0 .. $#pivotCol )
    {
        return false if $m->[$row][$pivotCol[$row]] != 1;
    }

    # Pivot columns must be in strictly increasing order
    for ( my ($i, $j) = (0, 1); $j <= $#pivotCol; $i++, $j++ )
    {
        return false if ( $pivotCol[$i] >= $pivotCol[$j] );
    }

    # There must be zeroes above all the pivots.
    my $maxPivot = $pivotCol[-1];
    for my $row ( 1 .. ($#pivotCol) )
    {
        my $col = $pivotCol[$row];
        return false if any { $_ != 0 }
                    map { $_->[$col] } $m->@[0 .. $row-1]
    }
    return true;
}

sub runTest
{
    use Test2::V0 -srand => 1;
    use builtin qw/true false/; no warnings "experimental::builtin";
    my $matrix = [
                   [1,0,0,1],
                   [0,1,0,2],
                   [0,0,1,3]
                 ];
    is( rre($matrix), true, "Example 0");

    $matrix = [
                [1, 1, 0],
                [0, 1, 0],
                [0, 0, 0]
              ];
    is( rre($matrix), false, "Example 1");

    $matrix = [ [0, 1,-2, 0, 1],
                [0, 0, 0, 1, 3],
                [0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0]
              ];
    is( rre($matrix), true, "Example 2");

    $matrix = [ [1, 0, 0, 4],
                [0, 1, 0, 7],
                [0, 0, 1,-1]
              ];
    is( rre($matrix), true, "Example 3");

    $matrix = [ [0, 1,-2, 0, 1],
                [0, 0, 0, 0, 0],
                [0, 0, 0, 1, 3],
                [0, 0, 0, 0, 0]
              ];
    is( rre($matrix), false, "Example 4");

    $matrix = [ [0, 1, 0],
                [1, 0, 0],
                [0, 0, 0]
              ];
    is( rre($matrix), false, "Example 5");

    $matrix = [ [4, 0, 0, 0],
                [0, 1, 0, 7],
                [0, 0, 1,-1]
              ];
    is( rre($matrix), false, "Example 6");

    done_testing;
}
