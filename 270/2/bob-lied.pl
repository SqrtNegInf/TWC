#!/usr/bin/env perl
use v5.36;

use List::Util qw/max sum/;

use Getopt::Long;
my $X; my $Y;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "x:i" => \$X, "y:i" => \$Y);
runTest(); exit;

say equalizeArray(\@ARGV, $X, $Y);

sub equalizeArray($ints, $lvl1cost, $lvl2cost)
{
    if ( $ints->$#* < 1 )
    {
        # Nothing to add to, no moves possible
        return 0;
    }
    elsif ( $ints->$#* == 1 )
    {
        # Only Level 1 moves are possible.
        return abs($ints->[1] - $ints->[0]) * $lvl1cost;
    }

    my @list = sort { $b <=> $a } $ints->@*;
    my $target = shift @list;

    if ( $lvl2cost > (2 * $lvl1cost) )
    {
        # Cheaper to do all single moves
        my $addsNeeded = sum map { $target - $_ } $ints->@*;
        return $lvl1cost * $addsNeeded;
    }

    my $cost = 0;
    while ( @list )
    {
        # Delete elements that have reached the target.
        shift @list while @list && $list[0] == $target;

        if ( scalar(@list) == 0 )
        {
            return $cost;
        }
        elsif ( scalar(@list) == 1 )
        {
            # Only level 1 moves are still possible.
            return $cost + $lvl1cost * ( $target - $list[0] );

        }

        # Do a level2 move on the first two elements
        $list[0]++; $list[1]++;
        $cost += $lvl2cost;
    }
    return $cost;
}

sub bestCost($ints, $lvl1cost, $lvl2cost)
{
    my $target = max $ints->@*;
    my $addsNeeded = sum map { $target - $_ } $ints->@*;

    if ( $ints->$#* < 1 )
    {
        # Nothing to add to, no moves possible
        return 0;
    }
    elsif ( $ints->$#* == 1 )
    {
        # Only Level 1 moves are possible.
        return $addsNeeded * $lvl1cost;
    }

    if ( $lvl2cost <= 2 * $lvl1cost )
    {
        # Increment 2 at a time as long as we can
        my $cost  = $lvl2cost * int( $addsNeeded / 2 );
        $cost += $lvl1cost if $addsNeeded % 2;
        return $cost;
    }
    else
    {
        # Cheaper just to Level 1 moves
        return $addsNeeded * $lvl1cost;
    }
}

sub runTest
{
    use Test::More;

    is( equalizeArray([4,1],       3, 2),  9, "Example 1");
    is( equalizeArray([2,3,3,3,5], 2, 1),  6, "Example 2");
    is( equalizeArray([2,4,3,3,5], 2, 1),  7, "Example 2a");

    is( equalizeArray([5],         3, 2),  0, "No moves");
    is( equalizeArray([ ],         3, 2),  0, "Empty list");

    is( equalizeArray([4,1,1],     3, 9), 18, "Expensive level 2");
    is( equalizeArray([4,1,1],     3, 6), 18, "lvl2 = 2 * lvl1");


    is( equalizeArray([20,1,1],    3, 4), 19*4, "All level 2 moves");
    is( equalizeArray([20,19,1],   3, 5), 1*5 + 18*3, "Only one lvl2, then fill");

    done_testing;
}
