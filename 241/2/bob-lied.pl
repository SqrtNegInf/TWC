#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util qw/factor/;
use Getopt::Long;

my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

say "(", join(", ", primeOrder(@ARGV)->@*), ")";

sub primeOrder(@int)
{
    [
        map { $_->[0] }
            sort { $a->[1] <=> $b->[1] || $a->[0] <=> $b->[0] }
                map { [ $_, scalar(factor($_)) ] } @int
    ]
}

sub runTest
{
    use Test::More;

    is_deeply( primeOrder(11, 8, 27, 4), [ 11, 4, 8, 27 ], "Example 1");

    done_testing;
}
