#!/usr/bin/env perl

use v5.36;

no warnings "experimental::builtin";
use builtin qw(true false ceil);

use List::Util qw/sum0/;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();exit;

sub canSplitAvg(@nums)
{
    my $n = @nums;
    my $totalSum = 0;
    $totalSum += $_ for @nums;

    for ( my $Na = 1; $Na <= int($n / 2); $Na++ )
    {
        if ( ($totalSum * $Na) % $n == 0 )
        {
            my $Sa = $totalSum * $Na / $n;
            say "canSplit: totalSum=$totalSum Sa=$Sa, Na=$Na" if $Verbose;
            return true if ( canMakeSum(\@nums, $Sa, $Na, 0, "") )
        }
    }
    return false;
}

sub canMakeSum($nums, $targetSum, $targetLength, $start, $indent)
{
    say "${indent}canMakeSum([$nums->@*]), $targetSum, $targetLength, $start)" if $Verbose;
    return ($targetSum == 0) if ( $targetLength == 0 );

    return 0 if ($start >= @$nums);

    for ( my $i = $start; $i < @$nums; $i++ )
    {
        if ( $nums->[$i] <= $targetSum
            && canMakeSum($nums, $targetSum - $nums->[$i], $targetLength - 1, $i + 1, "  $indent") )
        {
            return true;
        }
    }
    return false;
}


sub runTest
{
    use Test::More;
    no warnings "experimental::builtin";
    use builtin qw(true false);

    is( canSplitAvg(1, 3), false, "Example 2");
    is( canSplitAvg(3, 3), true,  "Obviously");
    is( canSplitAvg(1..8), true,  "Example 1");
    is( canSplitAvg(1,1,2,2,3,3,4,4), true, "why duplicate");
    is( canSplitAvg(1,4,3,4,3,2,1,2), true, "no duplicate");

    done_testing;
}

