#!/usr/bin/env perl
use v5.36;


use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;
my $Benchmark = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose, "benchmark:i" => \$Benchmark);
runTest(); exit;

say maxFreq(@ARGV);

sub maxFreq(@ints)
{
    use List::MoreUtils qw/frequency/;
    use List::Util qw/max sum/;

    my %freq = frequency @ints;
    my $max = max values %freq;

    return sum grep { $_ == $max } values %freq;
}

sub runTest
{
    use Test2::V0 -no_srand;

    is( maxFreq(1,2,2,4,1,5), 4, "Example 1");
    is( maxFreq(1,2,3,4,5  ), 5, "Example 2");

    done_testing;
}
