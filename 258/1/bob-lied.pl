#!/usr/bin/env perl
use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();exit;

say cedn( map { s/[^0-9]//gr } @ARGV);

sub cedn(@ints)
{
    return scalar grep { length($_) % 2 == 0 }  @ints;
}

sub runTest
{
    use Test::More;

    is(cedn(10, 1, 111, 24, 1000), 3, "Example 1");
    is(cedn(111, 1, 11111),        0, "Example 2");
    is(cedn(2, 8, 1024, 256),      1, "Example 3");

    done_testing;
}
