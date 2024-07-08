#!/usr/bin/env perl

use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;
my $Benchmark = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose, "benchmark:i" => \$Benchmark);
runTest(); exit;

say completeDay(@ARGV);

sub completeDay(@hours)
{
    my $complete = 0;
    while ( defined(my $first = shift @hours) )
    {
        for my $second (@hours )
        {
            $complete++ if ($first+$second)%24 == 0;
        }
    }
    return $complete;
}

sub runTest
{
    use Test2::V0 -no_srand;

    is( completeDay(12,12,30,24,24), 2, "Exsmple 1");
    is( completeDay(72,48,24, 5   ), 3, "Exsmple 2");
    is( completeDay(12,18,24      ), 0, "Exsmple 3");

    done_testing;
}
