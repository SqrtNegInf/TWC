#!/usr/bin/env perl
use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();exit;

sub cval(@ints)
{
    my $val = 0;
    $val += ( shift(@ints) . (pop(@ints) // "") ) while @ints;
    return $val;
}

sub runTest
{
    use Test::More;

    is( cval(6,12,25,1),    1286, "Example 1");
    is( cval(10,7,31,5,2,2), 489, "Example 2");
    is( cval(1,2,10),        112, "Example 3");

    done_testing;
}
