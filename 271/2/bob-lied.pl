#!/usr/bin/env perl
use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();  exit;

say "(", join(", ", sortBy1Bits(@ARGV)->@*), ")";

sub sortBy1Bits(@ints)
{
    my @bits = map { (my $b = sprintf("%b", $ints[$_])) =~ tr/1/1/ } 0 .. $#ints;
    return [ @ints[ sort { $bits[$a] <=> $bits[$b] || $ints[$a] <=> $ints[$b] } 0 .. $#ints ] ];
}

sub runTest
{
    use Test2::V0 -no_srand;

    is( sortBy1Bits(0, 1, 2, 3, 4, 5, 6, 7, 8), [ 0,1,2,4,8,3,5,6,7 ], "Example 1");
    is( sortBy1Bits(1024, 512, 256, 128, 64  ), [64,128,256,512,1024], "Example 2");

    done_testing;
}
