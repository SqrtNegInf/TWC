#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();exit;

sub matchingMembers($list)
{
    my @sorted = sort { $a <=> $b } @$list;

    grep { $list->[$_] == $sorted[$_] } ( 0 .. $list->$#* )
}

sub runTest
{
    use Test::More;

    is( matchingMembers( [1,1,4,2,1,3] ), 3, "Example 1");
    is( matchingMembers( [5,1,2,3,4  ] ), 0, "Example 2");
    is( matchingMembers( [1,2,3,4,5  ] ), 5, "Example 3");

    done_testing;
}

