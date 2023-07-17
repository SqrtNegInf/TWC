#!/usr/bin/env perl
use v5.36;

use List::Util qw/sum0/;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();exit;

say "(", join(", ", lrsd(@ARGV)->@*), ")";

sub lrsd(@ints)
{
    my $left = 0;
    my $right = sum0(@ints);

    # Accumulate the differences in this array.  Pre-allocate to be the
    # same size as the input array.
    my @diff; $#diff = $#ints;

    # Walk the array. At each step, add a term to the left sum
    # and subtract a term from the right sum.
    for my $i ( 0 .. $#ints )
    {
        $right -= $ints[$i];
        $diff[$i] = abs($left - $right);
        $left += $ints[$i];
    }
    return \@diff;
}

sub runTest
{
    use Test::More;

    is_deeply( lrsd(10,4,8,3 ), [ 15,  1, 11, 22     ], "Example 1");
    is_deeply( lrsd(1        ), [  0                 ], "Example 2");
    is_deeply( lrsd(1,2,3,4,5), [ 14, 11,  6,  1, 10 ], "Example 3");

    done_testing;
}
