#!/usr/bin/env perl
use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Start = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "start" => \$Start);
runTest();exit;

say multiplyByTwo($Start, @ARGV);

sub multiplyByTwo($start, @ints)
{
    my %present = map { $_ => true } @ints;
    $start *= 2 while ( exists $present{$start} );
    return $start;
}

sub runTest
{
    use Test::More;

    is( multiplyByTwo(3, (5,3,6,1,12) ), 24, "Example 1");
    is( multiplyByTwo(1, (1,2,4,3)    ),  8, "Example 2");
    is( multiplyByTwo(2, (5,6,7)      ),  2, "Example 3");

    done_testing;
}
