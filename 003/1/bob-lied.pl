#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
my $Max = shift;
$Max //= 50;

sub fiveSmooth($max)
{
    my @smoothNumbers;
    for ( my $mult2 = 1; $mult2 <= $max ; $mult2 *= 2 )
    {
        for ( my $mult3 = $mult2 ; $mult3 <= $max ; $mult3 *= 3 )
        {
            for ( my $mult5 = $mult3 ; $mult5 <= $max ; $mult5 *= 5 )
            {
                push @smoothNumbers, $mult5 unless $mult5 == 1;    # Not in order
            }
        }
    }
    return \@smoothNumbers;
}
exit(!runTest()) if $DoTest;
my $smoothList = fiveSmooth($Max);
say $_ foreach sort { $a <=> $b} @$smoothList;

sub runTest
{
    use Test::More;

    is_deeply( fiveSmooth( 2), [ 2 ], "max = 2");
    is_deeply( fiveSmooth( 3), [ 2, 3 ], "max = 3");
    is_deeply( fiveSmooth( 5), [ 2, 3, 4, 5 ], "max = 5");
    is_deeply( fiveSmooth(10), [ 2, 3, 4, 5, 6, 8, 9, 10  ], "max = 10");
    is_deeply( fiveSmooth(20), [ 2, 3, 4, 5, 6, 8, 9, 10, 12, 15, 16, 18, 20 ], "max = 20");

    done_testing;
}

