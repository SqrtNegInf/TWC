#!/usr/bin/env perl
use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

say uniqOcc(@ARGV);

sub uniqOcc(@ints)
{
    use List::MoreUtils qw/frequency all/;

    my %intFrequency = frequency(@ints);
    my %occurFreq = frequency( values %intFrequency );

    return ( all { $_ == 1 } values %occurFreq ) ? 1 : 0;
}

sub runTest
{
    use Test2::V0;

    is( uniqOcc(1,2,2,1,1,3),            1, "Example 1");
    is( uniqOcc(1,2,3)      ,            0, "Example 2");
    is( uniqOcc(-2,0,1,-2,1,1,0,1,-2,9), 1, "Example 3");

    done_testing;
}
