#!/usr/bin/env perl

use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

my $arr1 = shift;
my $arr2 = shift;

die qq(Usage $0 "list 1" "list 2") unless $arr1 and $arr2;

say STDOUT ( sameString([ split(' ', $arr1) ], [ split(' ', $arr2) ] ) )
      ? "true"
      : "false"
      ;

sub sameString($listA, $listB)
{
    local $" = '';
    return "$listA->@*" eq "$listB->@*";
}

sub ss2($listA, $listB)
{
    return join("", $listA->@*) eq join("", $listB->@*);
}

sub runTest
{
    use Test::More;
    no warnings "experimental::builtin";

    is( sameString(["ab", "c"], ["a", "bc"]),     true,  "Example 1");
    is( sameString(["ab", "c"], ["ac", "b"]),     false, "Example 2");
    is( sameString(["ab", "cd", "e"], ["abcde"]), true,  "Example 3");

    done_testing;
}
