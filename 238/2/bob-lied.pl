#!/usr/bin/env perl

use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();exit;

say "(", join(", ",  persistenceSort(@ARGV)->@*), ")";

# Product of digits, treating the number as a string
sub r2d($n)
{
use List::Util qw/product/;
    my $step = 0;
    while ( $n > 9 )
    {
        ++$step;
        $n = product split(//, $n);
    }
    return $step;
}

# Product of digits, pure arithmetic
sub reduceToDigit($n)
{
    my $step = 0;
    while ( $n > 9 )
    {
        $step++;
        my $p = 1;
        while ( $n )
        {
            $p *= $n % 10;
            $n = int($n/10);
        }
        $n = $p;
    }
    return $step;
}

# Schwartzian transform
#  -- convert each input into a [value, stepcount] pair
#  -- Sort by the step count, and then the value
#  -- Drop the step count from each pair in the sorted list
sub persistenceSort(@int)
{
    return [ map { $_->[0] }
        sort { $a->[1] <=> $b->[1] || $a->[0] <=> $b->[1] }
        map { [ $_, reduceToDigit($_) ] } @int ];
}

sub runTest
{
    use Test::More;

    is_deeply( reduceToDigit(0), 0, "reduce: 0");
    is_deeply( reduceToDigit(1), 0, "reduce: 1");
    is_deeply( reduceToDigit(10+$_), 1, "reduce: 1$_") for 0..9;
    is_deeply( reduceToDigit(10*$_), 1, "reduce: ${_}0") for 1..9;
    is_deeply( reduceToDigit(99), 2, "reduce: 99");
    is_deeply( reduceToDigit(34), 2, "reduce: 34");
    is_deeply( reduceToDigit(50), 1, "reduce: 50");
    is_deeply( reduceToDigit(25), 2, "reduce: 25");
    is_deeply( reduceToDigit(33), 1, "reduce: 33");
    is_deeply( reduceToDigit(22), 1, "reduce: 22");
    is_deeply( reduceToDigit(8432), 3, "reduce 8432");

    is_deeply( persistenceSort(15,99,1,34),  [1,15,34,99 ], "Example 1");
    is_deeply( persistenceSort(50,25,33,22), [22,33,50,25], "Example 2");

    is_deeply( persistenceSort( ),  [ ], "Empty list");
    is_deeply( persistenceSort(5),  [5], "Single digit");
    is_deeply( persistenceSort(36), [36], "Single number");

    done_testing;
}
