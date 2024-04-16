#!/usr/bin/env perl
use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

sub targArr($source, $indices)
{
    my @target = ();
    for my $i ( 0 .. $indices->$#* )
    {
        splice(@target, $indices->[$i], 0, $source->[$i]);
        say "$i\t$source->[$i]\t$indices->[$i],(@target)" if $Verbose;
    }
    return \@target;
}

sub runTest
{
    use Test2::V0 -srand => 1;

    is( targArr([0,1,2,3,4],[0,1,2,2,1]), [0,4,1,3,2], "Example 1");

    is( targArr([1,2,3,4,0],[0,1,2,3,0]), [0,1,2,3,4], "Example 2");

    is( targArr([1],[0]), [1], "Example 3");

    done_testing;
}
