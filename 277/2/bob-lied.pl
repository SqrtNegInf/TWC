#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 1;
my $Benchmark = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose, "benchmark:i" => \$Benchmark);
runTest(); exit;

say strongPair(@ARGV);

sub strongPair(@ints)
{
    use List::Util qw/min uniqnum/;

    # Remove duplicate values
    @ints = uniqnum sort { $a <=> $b } @ints;

    my $count = 0;
    while ( defined(my $first = shift @ints) )
    {
        for my $second ( @ints )
        {
            $count++ if abs($first - $second) < min($first, $second);
            if ( $Verbose )
            {
                my $abs = abs($first - $second);
                my $min = min($first, $second);
                say "($first,$second): abs=$abs min=$min count=$count";
            }
        }
    }
    return $count;
}

sub runTest
{
    use Test2::V0 -no_srand;

    is( strongPair(1,2,3,4,5), 4, "Example 1");
    is( strongPair(5,7,1,7  ), 1, "Example 2");

    done_testing;
}
