#!/usr/bin/env perl

use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();exit;

say "(", join(", ", buildArray(@ARGV)->@*), ")";

sub buildArray(@int)
{

    return [ @int[@int] ];
}

sub runTest
{
    use Test::More;

    is_deeply( buildArray(0,2,1,5,3,4), [0,1,2,4,5,3],  "Example 1");
    is_deeply( buildArray(5,0,1,2,3,4), [4,5,0,1,2,3],  "Example 2");

    done_testing;
}
