#!/usr/bin/env perl
use v5.36;

use Algorithm::Permute;
use List::Util qw(all);

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

sub isSquare($n)
{
    my $r = sqrt($n);
    return $r == int($r);
}

sub pairSum($list)
{
    return map { $list->[$_-1] + $list->[$_] } 1 .. ($list->$#*);
}

sub uniqify($arrOfArr)
{
    my %presence;
    my @unique;
    for my $list ( $arrOfArr->@* )
    {
        my $hash = join("|", $list->@*);
        push @unique, $list unless exists $presence{$hash};
        $presence{$hash} = 1;
    }
    return \@unique;
}


sub squareful(@ints)
{
    my @isSquareful;
    Algorithm::Permute::permute {
        push @isSquareful, [ @ints] if all { isSquare($_) } pairSum(\@ints)
    } @ints;
    return uniqify(\@isSquareful);
}

sub runTest
{
    use Test2::V0;

    is( isSquare(6), '', "isSquare no");
    is( isSquare(16), 1, "isSquare yes");

    is( [ pairSum([1,2,3,9]) ], [3,5,12], "pairSum");

    is(squareful(1, 17, 8), [ [1,8,17], [17,8,1] ], "Example 1");
    is(squareful(2,  2, 2), [ [2,2,2]            ], "Example 2");

    done_testing;
}
