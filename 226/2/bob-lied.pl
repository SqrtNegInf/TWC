#!/usr/bin/env perl
use v5.36;

use List::Util qw/uniq/;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

say zeroArray(@ARGV);

sub zeroArray(@ints)
{
    return scalar(grep { $_ != 0 } uniq @ints);
}

sub runTest
{
    use Test::More;

    is( zeroArray(1,5,0,3,5), 3, "Example 1");
    is( zeroArray(0),         0, "Example 2");
    is( zeroArray(2,1,4,0,3), 4, "Example 3");

    done_testing;
}
