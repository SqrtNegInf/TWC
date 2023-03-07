#!/usr/bin/env perl

use v5.36;

use List::Util qw/sum/;

use Getopt::Long;
my $DoTest  = 0;

GetOptions("test" => \$DoTest);
runTest(); exit;

say arrayPairs(\@ARGV);

sub arrayPairs($list)
{
    my @oddIndex = map { $_ * 2 + 1 } 0 .. int( $#{$list} / 2 );
    return sum(  (sort { $b <=> $a } $list->@*)[@oddIndex] );
}


sub runTest
{
    use Test::More;

    is( arrayPairs([1,2,3,4]), 4, "Example 1");
    is( arrayPairs([0,2,1,3]), 2, "Example 1");

    is( arrayPairs([3,3,3,3]), 6, "All same");
    is( arrayPairs([1,2,3,4,5,6,7,8]), 16, "1..8");

    done_testing;
}
