#!/usr/bin/env perl
use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();exit;

say countEqDiv(@ARGV);

sub countEqDiv($k, @ints)
{
    my $count = 0;
    for ( my $i = 0 ; $i < $#ints ; $i++ )
    {
        for ( my $j = $i+1; $j <= $#ints; $j++ )
        {
            $count++ if ( $ints[$i] == $ints[$j] && (($i * $j) % $k == 0) )
        }
    }
    return $count;
}

sub runTest
{
    use Test::More;

    is( countEqDiv(2, (3,1,2,2,2,1,3) ), 4, "Example 1");
    is( countEqDiv(1, (1,2,3)         ), 0, "Example 2");

    done_testing;
}
