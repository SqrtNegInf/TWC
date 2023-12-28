#!/usr/bin/env perl
use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();exit;

sub sms($m)
{
    my $height = $m->$#*;
    my $width  = $m->[0]->$#*;

    my @output;
    push @output, [ (0) x $width ] for 0 .. $height -1;

    for my $i (  0 .. $height-1 )
    {
        for my $k ( 0 .. $width-1 )
        {
            $output[$i][$k] = $m->[$i  ][$k] + $m->[$i  ][$k+1]
                            + $m->[$i+1][$k] + $m->[$i+1][$k+1];
        }
    }
    return \@output;
}

sub runTest
{
    use Test::More;

    is_deeply( sms( [ [1,  2,  3,  4],
               [5,  6,  7,  8],
               [9, 10, 11, 12] ]),
            [ [14, 18, 22], [30, 34, 38] ] , "Example 1");

    is_deeply( sms( [ [1, 0, 0, 0],
               [0, 1, 0, 0],
               [0, 0, 1, 0],
               [0, 0, 0, 1] ] ),
            [ [2, 1, 0],
              [1, 2, 1],
              [0, 1, 2] ], "Example 2");

    done_testing;
}
