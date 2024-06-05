#!/usr/bin/env perl
use v5.36;

use List::Util qw/sum/;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

sub maxOnes($matrix)
{
    my $most = 0;
    my $mostRow = 0;
    for my $row ( 0 .. $matrix->$#* )
    {
        my $count = sum $matrix->[$row]->@*;
        if ( $count > $most )
        {
            $most = $count;
            $mostRow = $row+1;
        }
    }
    return $mostRow;
}

sub runTest
{
    use Test2::V0 -no_srand;

    is( maxOnes([ [0,1], [1,0] ]), 1, "Example 1");
    is( maxOnes([ [0,0,0], [1,0,1] ]), 2, "Example 2");
    is( maxOnes([ [0,0],[1,1],[0,0] ]), 2, "Example 3");

    done_testing;
}
