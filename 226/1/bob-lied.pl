#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();exit;

sub shuffleString($str, @indices)
{
    my @result;

    # Literal mapping of indices in a loop
    # my @s = split(//, $str);
    # while ( my ($inIndex, $outIndex) = each @indices )
    # {
    #     $result[$outIndex] = $s[$inIndex]
    # }

    # Shorter, using array slice
    @result[@indices] = split(//, $str);

    return join("", @result);
}

sub runTest
{
    use Test::More;

    is( shuffleString("lacelengh", 3,2,0,5,4,8,6,7,1 ), 'challenge', "Example 1");
    is( shuffleString("rulepark",  4,7,3,1,0,5,2,6 ),   'perlraku',  "Example 2");

    done_testing;
}

