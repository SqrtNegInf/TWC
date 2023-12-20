#!/usr/bin/env perl

use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();
exit;

sub mflp($s)
{
    my %freq;
    $freq{$_}++ for map { substr($s, $_, 2) } 0 .. (length($s)-2);
    return (sort { $freq{$b} <=> $freq{$a} || $a cmp $b } keys %freq)[0];
}

sub runTest
{
    use Test::More;

    is_deeply( mflp("abcdbca"),           'bc', "Example 1");
    is_deeply( mflp("cdeabeabfcdfabgcd"), 'ab', "Example 2");

    done_testing;
}
