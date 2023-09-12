#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

my $inMinMax = minMax(@ARGV);
if ( @$inMinMax == 0 )
{
    say "-1";
}
else
{
    say "(", join(", ", $inMinMax->@*), ")";
}

sub minMax(@list)
{
    my ($min, $max) = ($list[0], $list[0]);

    # One pass to find the minimum and the maximum.
    # Could also use List::MoreUtils::minmax
    for my $elem ( @list )
    {
        $min = $elem if $elem < $min;
        $max = $elem if $elem > $max;
    }

    return [ grep { $_ > $min && $_ < $max } @list ];
}

# Does not preserve order of elements
sub minMax_sort(@list)
{
    my @sorted = sort { $a <=> $b } @list;
    return [ grep { $_ > $sorted[0] && $_ < $sorted[-1] } @sorted ];
}

sub runTest
{
    use Test::More;

    is_deeply( minMax(3,2,1,4), [3,2], "Example 1");
    is_deeply( minMax(3,1),     [],    "Example 2");
    is_deeply( minMax(2,1,3  ), [2],   "Example 3");

    is_deeply( minMax_sort(3,2,1,4), [2,3], "Example 1");
    is_deeply( minMax_sort(3,1),     [],    "Example 2");
    is_deeply( minMax_sort(2,1,3  ), [2],   "Example 3");

    done_testing;
}
