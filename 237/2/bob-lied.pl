#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

say maximizeGreatness(@ARGV);

sub maximizeGreatness(@nums)
{
    my $greatness = 0;

    # Work in a sorted array.
    my @num = sort { $a <=> $b } @nums;

    my $small = 0;
    my $big = 0;

    while ( ++$big <= $#num )
    {
        # Advance until we find a bigger number to pair with
        if ( $num[$big] > $num[$small] )
        {
            say "Found num[$small], num[$big] = $num[$small], $num[$big]" if $Verbose;
            $greatness++;
            $small++;   # Move on to next smaller number
        }
    }
    return $greatness;
}

sub runTest
{
    use Test::More;

    is( maximizeGreatness(1,3,5,2,1,3,1), 4, "Example 1");
    is( maximizeGreatness(1,2,3,4      ), 3, "Example 2");

    is( maximizeGreatness(             ), 0, "Empty array");
    is( maximizeGreatness( 20          ), 0, "One element");
    is( maximizeGreatness( 1,1,1,1     ), 0, "Opposite of great");
    is( maximizeGreatness( 3,20,100    ), 2, "Bigger numbers, sort check");

    done_testing;
}
