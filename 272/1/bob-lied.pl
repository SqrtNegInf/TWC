#!/usr/bin/env perl
use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

say defangIP($_) for ["1.1.1.1"];

sub defangIP($ip)
{
    $ip =~ s/\./[.]/gr;
}

sub runTest
{
    use Test2::V0 -no_srand;

    is( defangIP("1.1.1.1"),     "1[.]1[.]1[.]1",     "Example 1");
    is( defangIP("255.101.1.0"), "255[.]101[.]1[.]0", "Example 2");

    done_testing;
}
