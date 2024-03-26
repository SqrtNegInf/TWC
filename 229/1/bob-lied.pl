#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

# This version doesn't actually perform deletions, it just counts how
# many would be deleted, which satisfies the output requirement.
sub lexicographicOrderCount(@str)
{
    my $isSorted = @str;    # Assume all are sorted
    for my $word ( @str )
    {
        my $sorted = join("", sort { $a cmp $b} split("", $word) );
        $isSorted-- if $word eq $sorted || $word eq reverse($sorted);
    }
    return $isSorted;
}

# This version also provides a list with unsorted elements removed.
sub lexicographicOrder(@str)
{
    my $deleteCount = 0;
    my @keepList; # Instead of deleting, build new list of kept words
    for my $word ( @str )
    {
        my $sorted = join("", sort { $a cmp $b} split("", $word) );
        if ( $word eq $sorted || $word eq reverse($sorted) )
        {
            push @keepList, $word;
        }
        else
        {
            $deleteCount++;
        }
    }
    return ($deleteCount, \@keepList);
}

sub runTest
{
    use Test2::V0;

    is( lexicographicOrderCount("abc", "bce", "cae"), 1, "Example 1 count only");
    is( lexicographicOrderCount("yxz", "cba", "mon"), 2, "Example 2 count only");

    my ($count, $list);
    ($count, $list) = lexicographicOrder("abc", "bce", "cae");
    is ( $count, 1, "Example 1 count");
    is ( $list, ["abc", "bce"], "Example 1 list");

    ($count, $list) = lexicographicOrder("yxz", "cba", "mon");
    is ( $count, 2, "Example 2 count");
    is ( $list, ["cba"], "Example 2 list");

    done_testing;
}
