#!/usr/bin/env perl
use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();exit;

sub game(@ints)
{
    return [ (sort { $a <=> $b } @ints)[ map { 2*$_+1, 2*$_ } 0 .. $#ints/2 ] ];
}

sub runTest
{
    use Test2::V0 -no_srand;

    is( game(2,5,3,4),         [3,2,5,4], "Example 1");
    is( game(9,4,1,3,6,4,6,1), [1,1,4,3,6,4,9,6], "Example 2");
    is( game(1,2,2,3),         [2,1,3,2], "Example 3");

    done_testing;
}
