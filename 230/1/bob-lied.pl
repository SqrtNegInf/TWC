#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

say "(", join(", ", separateDigits(@ARGV)->@*), ")";

sub separateDigits(@list)
{
    return [ map { split(//, $_) } @list ];
}

sub runTest
{
    use Test::More;

    is_deeply( separateDigits(1,34,5,6),   [1,3,4,5,6], "Example 1");
    is_deeply( separateDigits(1,24,51,60), [1,2,4,5,1,6,0], "Example 2");

    done_testing;
}
