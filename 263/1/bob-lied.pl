#!/usr/bin/env perl

use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Target = 0;
my $DoTest  = 0;

GetOptions("dotest" => \$DoTest, "Target:i" => \$Target);
runTest();exit;

say "(", join(",", targetIndex($Target, @ARGV)->@*), ")";

sub targetIndex($k, @ints)
{
    my ($below, $same) = (0, 0);
    foreach ( @ints )
    {
        if    ( $_ < $k )  { $below++ }
        elsif ( $_ == $k ) { $same++ }
    }
    return [] if $same == 0;

    return [ $below .. ($same + $below - 1) ];
}

sub runTest
{
    use Test2::V0 -srand => 1;

    is( targetIndex(2, (1, 5, 3, 2, 4, 2) ), [1, 2], "Example 1");
    is( targetIndex(6, (1, 2, 4, 3, 5   ) ), [    ], "Example 2");
    is( targetIndex(4, (5, 3, 2, 4, 2, 1) ), [  4 ], "Example 3");

    done_testing;
}
