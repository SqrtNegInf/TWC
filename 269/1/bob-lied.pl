#!/usr/bin/env perl
use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

sub task1(@ints)
{
    return false unless @ints;
    return !($ints[0] & 1) if scalar(@ints) == 1;

    my $evenCount = 0;
    while ( defined(my $n = shift @ints) )
    {
        return true if (($n & 1) == 0) && ++$evenCount > 1;
    }
    return false;
}

sub runTest
{
    use Test::More;
use builtin qw/true false/; no warnings "experimental::builtin";

    is( task1(1,2,3,4,5),  true, "Example 1");
    is( task1(2,3,8,16),   true, "Example 2");
    is( task1(1,2,5,7,9), false, "Example 3");
    is( task1(4),          true, "One even number");
    is( task1(5),         false, "One odd number");
    is( task1(),          false, "Empty list");

    done_testing;
}
