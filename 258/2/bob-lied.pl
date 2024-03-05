#!/usr/bin/env perl

use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $K = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "k:i" => \$K);
runTest();exit;

say sumOfVal($K, @ARGV);

sub hasKones($k, $n)
{
    return ( sprintf("%b", $n) =~ tr/1/1/) == $k;
}

sub sumOfVal($k, @ints)
{
    use List::Util qw/sum0/;

    return sum0( @ints[ grep { hasKones($k, $_) } 0 .. $#ints ] );
}

sub runTest
{
    use Test::More;
    use builtin qw/true false/; no warnings "experimental::builtin";

    is( hasKones(1, 0), false, "k ones 1 0");
    is( hasKones(1, 4), true,  "k ones 1 4");
    is( hasKones(2, 5), true,  "k ones 2 5");
    is( hasKones(1, 6), false, "k ones 1 6");
    is( hasKones(2, 6), true,  "k ones 2 6");
    is( hasKones(2, 7), false, "k ones 2 7");
    is( hasKones(1, 8), true,  "k ones 1 8");
    is( hasKones(2, 8), false, "k ones s 8");
    is( hasKones(3, 8), false, "k ones 3 8");

    is( sumOfVal(1, (2,5,9,11,3)), 17, "Example 1");
    is( sumOfVal(2, (2,5,9,11,3)), 11, "Example 2");
    is( sumOfVal(0, (2,5,9,11,3)),  2, "Example 3");

    done_testing;
}
