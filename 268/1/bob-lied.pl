#!/usr/bin/env perl
use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

sub mn :prototype(\@@)
{
    my @x = @{shift @_};
    my @y = @_;
    say "x: (", join(",", @x), ")";
    say "y: (", join(",", @y), ")";
}
my @x=(1,2); my @y=(3,4);
mn(@x, @y);

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();  exit;

sub validate($x, $y, $magic)
{
    return undef if $x->$#* != $y->$#*;
    my %should_be_y;
    $should_be_y{$_ + $magic} = $_ for $x->@*;
    delete $should_be_y{$_} for $y->@*;
    return scalar(%should_be_y) == 0 ? $magic : undef;
}

sub magicNumber($x, $y)
{
    use List::Util qw/min/;
    return validate($x, $y, min($y->@*) - min($x->@*));
}

sub runTest
{
    use Test2::V0 -no_srand;

    is( magicNumber([3,7,5], [9,5,7]), 2, "Example 1");
    is( magicNumber([1,2,1], [5,4,4]), 3, "Example 2");
    is( magicNumber([2    ], [5    ]), 3, "Example 3");

    is( magicNumber([9    ], [8,7  ]), undef, "Different lengths");
    is( magicNumber([9,6,4], [7,3,6]), undef, "No magic");
    is( magicNumber([2,2,5], [4,4,7]), 2,     "With repeats");

    done_testing;
}
