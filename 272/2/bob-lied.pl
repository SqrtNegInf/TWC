#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

say stringScore($_) for @ARGV;

sub stringScore($str)
{
    my @v = map { ord($_) } split(//, $str);

    my $score = 0;

    for ( my $first = shift @v ; defined(my $second = shift @v) ; $first = $second )
    {
        $score += abs($first - $second);
    }

    return $score;
}

sub runTest
{
    use Test2::V0 -no_srand;

    is( stringScore("hello"), 13, "Example 1");
    is( stringScore("perl"),  30, "Example 2");
    is( stringScore("raku"),  37, "Example 3");

    is( stringScore(""),  0, "Empty string");
    is( stringScore("R"), 0, "length 1 string");
    is( stringScore("LLL"), 0, "repeated letters");

    done_testing;
}
