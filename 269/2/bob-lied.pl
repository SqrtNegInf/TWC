#!/usr/bin/env perl
use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();exit;

say "(", join(", ", distElem(@ARGV)->@*), ")";

sub distElem(@ints)
{
    my @arr = ( [ (shift @ints) // () ], [ (shift @ints) // () ] );

    push @{$arr[ ( $arr[0][-1] <= $arr[1][-1] ) ]}, $_ for @ints;

    return [ $arr[0]->@*, $arr[1]->@* ];
}

sub runTest
{
    use Test2::V0 -no_srand;

    is( distElem(2,1,3,4,5), [2,3,4,5,1], "Example 1");
    is( distElem(3,2,4    ), [3,4,2]    , "Example 2");
    is( distElem(5,4,3,8  ), [5,3,4,8]  , "Example 3");

    is( distElem(5,4      ), [5,4    ]  , "Two elements");
    is( distElem(5        ), [5      ]  , "One element");
    is( distElem(         ), [       ]  , "Zero element");

    done_testing;
}
