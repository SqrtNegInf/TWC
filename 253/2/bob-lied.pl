#!/usr/bin/env perl

use v5.36;

use builtin qw/trim/; no warnings "experimental::builtin";
use List::Util qw/sum/;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();exit;

# USAGE: give rows as strings on command line, e.g.
# ./ch-1.pl "[1,0,0]" "[0,1,0]" "[0,0,1]"
# ./ch-1.pl 1,0,0 0,1,0 0,0,1
my @r = map { trim($_) } map { (s/[^01]+/ /gr) } @ARGV;
say join "|", @r if $Verbose;
my @matrix = map { [ split ' ', $_ ] } @r;
say "(", join(", ", weakestRow(\@matrix)->@*), ")";

sub weakestRow($m)
{
    my @strength = map { sum $_->@* } $m->@*;

    return [ sort { $strength[$a] <=> $strength[$b] || $a <=> $b } 0 .. $m->$#* ];
}

sub runTest
{
    use Test2::V0  -srand => 1;

    my $matrix;
    $matrix = [ [1, 1, 0, 0, 0],
                [1, 1, 1, 1, 0],
                [1, 0, 0, 0, 0],
                [1, 1, 0, 0, 0],
                [1, 1, 1, 1, 1] ];
    is(weakestRow($matrix), [ 2,0,3,1,4 ], "Example 1");

    $matrix = [ [1, 0, 0, 0],
                [1, 1, 1, 1],
                [1, 0, 0, 0],
                [1, 0, 0, 0] ];
    is(weakestRow($matrix), [   0,2,3,1 ], "Example 2");

    done_testing;
}
