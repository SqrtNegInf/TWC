#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

say "(", join(",", frequencySort(@ARGV)->@*), ")";

sub frequencySort(@list)
{
    use List::MoreUtils qw/frequency/;
    my %freq = frequency(@list);

    [ sort { $freq{$a} <=> $freq{$b} || $b <=> $a} @list ]
}

sub runTest
{
    use Test::More;

    is_deeply( frequencySort( 1,1,2,2,2,3 ),          [ 3,1,1,2,2,2 ], "Example 1");
    is_deeply( frequencySort( 2,3,1,3,2   ),          [ 1,3,3,2,2   ], "Example 2");
    is_deeply( frequencySort( -1,1,-6,4,5,-6,1,4,1 ), [ 5,-1,4,4,-6,-6,1,1,1 ], "Example 3");

    done_testing;
}
