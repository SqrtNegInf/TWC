#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

say "(", join(", ", runningSum(@ARGV)->@*), ")";

sub runningSum(@int)
{
    my @running;
    my $sum = 0;
    push @running, $sum += shift @int while @int;
    return \@running;
}

sub runTest
{
    use Test::More;

    is_deeply( runningSum(1,2,3,4,5), [1,3,6,10,15], "Example 1");
    is_deeply( runningSum(1,1,1,1,1), [1,2,3,4,5  ], "Example 2");
    is_deeply( runningSum(0,-1,1,2 ), [0,-1,0,2   ], "Example 3");

    is_deeply( runningSum(         ), [           ], "Empty list");
    is_deeply( runningSum(9234     ), [ 9234      ], "Singleton");

    done_testing;
}

