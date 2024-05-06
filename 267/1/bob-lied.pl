#!/usr/bin/env perl
use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();exit;

say prodSign(@ARGV);

sub prodSign(@ints)
{
    my $sign = 1;
    while ( $sign && defined(my $n = shift @ints) )
    {
        $sign *= ($n <=> 0);
    }
    return $sign;
}

sub runTest
{
    use Test2::V0;

    is( prodSign(-1, -2, -3, -4,  3, 2, 1),  1, "Example 1");
    is( prodSign( 1,  2,  0, -2, -1      ),  0, "Example 2");
    is( prodSign(-1, -1,  1, -1,  2      ), -1, "Example 3");

    done_testing;
}
