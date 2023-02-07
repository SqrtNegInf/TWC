#!/usr/bin/env perl

use v5.36;

use List::Util qw/all/;
use List::MoreUtils qw/first_index/;

use constant CONSECUTIVE => 3;

use Getopt::Long;
my $DoTest  = 0;
my $Consecutive = CONSECUTIVE;

GetOptions("test" => \$DoTest, "consecutive:i" => \$Consecutive);
runTest(); exit;

say consecOdd(\@ARGV, $Consecutive);

sub isOdd($n) { $n % 2 }


sub consecOdd($array, $consec=CONSECUTIVE)
{
    my $i = first_index { isOdd($_) } $array->@*;
    while ( defined $i && $i <= @$array - $consec )
    {
        return 1 if all { isOdd($_) } $array->@[$i .. ($i + $consec - 1)];
        while ( ! isOdd($array->[++$i]) ) {}
    }
    return 0;
}

sub runTest
{
    use Test2::V0;

    is( consecOdd([1,5,3,6]), 1, "Example 1");
    is( consecOdd([2,6,3,5]), 0, "Example 2");
    is( consecOdd([1,2,3,4]), 0, "Example 3");
    is( consecOdd([2,3,5,7]), 1, "Example 4");

    done_testing;
}
