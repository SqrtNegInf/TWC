#!/usr/bin/env perl
use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

say elementDigitSum(@ARGV);

sub elementDigitSum(@ints)
{
    use List::Util qw/sum0/;
    local $" = '';  # No space when interpolating array into string
    return abs(sum0(@ints) - sum0( split('', "@ints")));
}

sub runTest
{
    use Test::More;

    is( elementDigitSum(1,2,3,45       ),   36, "Example 1");
    is( elementDigitSum(1,12,3         ),    9, "Example 2");
    is( elementDigitSum(1,2,3,4        ),    0, "Example 3");
    is( elementDigitSum(236,416,336,350), 1296, "Example 4");
    is( elementDigitSum(               ),    0, "Empty list");

    done_testing;
}
