#!/usr/bin/env perl
use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
exit(!runTest()) if $DoTest;

say arrayLoops(@ARGV);

sub arrayLoops(@ints)
{
    my @isInAnyLoop = (false) x @ints;

    my $loopCount = 0;
    for ( my $start = 0 ; $start <= $#ints ; $start++ )
    {
        next if $isInAnyLoop[$start];

        my @visited = (false) x @ints;
        $visited[$start] = true;
        my @loop = ( $ints[$start] );

        my $next = $ints[$start];
        while ( ! $visited[$next] )
        {
            $isInAnyLoop[$next] = $visited[$next] = true;
            push @loop, $ints[$next] if $Verbose;
            $next = $ints[$next];
        }
        $loopCount++;
        say "LOOP: [@loop]" if $Verbose;
    }
    return $loopCount;
}

sub runTest
{
    use Test2::V0;

    is( arrayLoops( 4,6,3,8,15,0,13,18,7,16,14,19,17,5,11,1,12,2,9,10),
        3, "Example 1");
    is( arrayLoops( 0,1,13,7,6,8,10,11,2,14,16,4,12,9,17,5,3,18,15,19),
        6, "Example 2");
    is( arrayLoops( 9,8,3,11,5,7,13,19,12,4,14,10,18,2,16,1,0,15,6,17),
        1, "Example 3");

    done_testing;
}
