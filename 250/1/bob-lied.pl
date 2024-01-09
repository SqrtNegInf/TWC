#!/usr/bin/env perl
use v5.36;

use List::Util qw/first/;

use Getopt::Long;
my $DoTest  = 0;

GetOptions("test" => \$DoTest);
runTest(); exit;

say smallestIndex(@ARGV);

sub smallestIndex(@ints)
{
    return (first { ($_ % 10) == $ints[$_] } 0 .. $#ints) // -1;
}

sub runTest
{
    use Test::More;

    is( smallestIndex(0,1,2  ),  0, "Example 1");
    is( smallestIndex(4,3,2,1),  2, "Example 2");
    is( smallestIndex(1..9,0 ), -1, "Example 3");

    done_testing;
}
