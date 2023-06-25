#!/usr/bin/env perl
use v5.36;

use List::Util qw/first/;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();

#say H_index( @ARGV );

sub H_index(@cite)
{
    my @sorted = sort { $b <=> $a } @cite;
    my $h = first { $sorted[$_] < $_+1 } 0 .. $#sorted;
    return $h;
}

sub runTest
{
    use Test::More;

    is( H_index(10,8,5,4,3), 4, "Example 1");
    is( H_index(25,8,5,3,3), 3, "Example 2");
    is( H_index( 1,1,1,1,1), 1, "Example 2");

    done_testing;
}

