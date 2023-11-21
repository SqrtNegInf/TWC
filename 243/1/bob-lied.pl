#!/usr/bin/env perl
use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;
my $DoBenchmark = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose, "benchmark:i" => \$DoBenchmark);
runTest();exit;

exit(benchmark($DoBenchmark)) if $DoBenchmark;

sub reversePairs(@nums)
{
    my $count = 0;
    for ( my $i = 0 ; $i <= $#nums-1 ; $i++ )
    {
        for ( my $j = $i+1 ; $j <= $#nums ; $j++ )
        {
            $count++ if $nums[$i] > 2 * $nums[$j];
        }
    }
    return $count;
}

sub rp(@nums)
{
    my $count = 0;
    while ( my $i = shift @nums )
    {
        for my $j ( @nums )
        {
            $count++ if $i > 2 * $j;
        }
    }
    return $count;
}

sub rp_r($nums)
{
    my $count = 0;
    while ( my $i = shift @{$nums} )
    {
        for my $j ( $nums->@* )
        {
            $count++ if $i > 2 * $j;
        }
    }
    return $count;
}

sub runTest
{
    use Test2::V0 -srand => 1;

    is( reversePairs(1,3,2,3,1), 2, "Example 1");
    is( reversePairs(2,4,3,5,1), 3, "Example 2");

    is( rp(1,3,2,3,1), 2, "rp Example 1");
    is( rp(2,4,3,5,1), 3, "rp Example 2");

    is( rp_r([1,3,2,3,1]), 2, "rp_r Example 1");
    is( rp_r([2,4,3,5,1]), 3, "rp_r Example 2");

    done_testing;
}

sub benchmark($repeat)
{
    use Benchmark qw/:all/;

    my @data = ( map { rand(100) } 0 .. 99 );

    cmpthese($repeat, {
        'basic    ' => sub { my @nums = @data; reversePairs(@nums) },
        'shifting ' => sub { my @nums = @data; rp(@nums) },
        # 'reference' => sub { my @nums = @data; rp_r( \@nums ) },
    });
}
