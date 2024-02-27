#!/usr/bin/env perl

use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();exit;

say maxPair(@ARGV);

sub maxPair(@words)
{
    my $pairCount = 0;
    while ( defined(my $one = shift @words) )
    {
        for my $two ( @words )
        {
            do { $pairCount++; last } if $one eq reverse($two);
        }
    }
    return $pairCount;
}

sub runTest
{
    use Test::More;

    is( maxPair( qw(ab de ed  bc     ) ), 1, "Example 1");
    is( maxPair( qw(aa ba cd ed      ) ), 0, "Example 2");
    is( maxPair( qw(uv qp st vu mn pq) ), 2, "Example 3");

    done_testing;
}
