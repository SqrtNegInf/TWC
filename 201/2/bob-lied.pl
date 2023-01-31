#!/usr/bin/env perl

use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); 

say pennyPiles($_) for @ARGV;

sub pennyPiles($n)
{
    # We're accumulating all the possible orderings. We don't
    # really have to do that to get the answer, but it helps debugging.
    my @result = ( [ $n ] );
    say "PUSH [ $n ]" if $Verbose;
    _pile(1, $n-1, [], \@result, "");

    say showResult(\@result) if $Verbose;
    return scalar(@result);
}

sub _pile($p, $q, $soFar, $result, $indent)
{
    say "${indent}[$soFar->@*] _pile($p, $q)," if $Verbose;

    # Take pairs of summands, but only in one order
    while (  $p <= $q )
    {
        say "${indent}PUSH [ $soFar->@* $p $q ]" if $Verbose;
        push @$result, [ $soFar->@*, $p, $q ];

        # If the second term can be split into additions where both
        # terms are greater than p, then recurse to that.
        # For example, (2 6) can split the 6 into 2+4 or 3+3, but not
        # 1+5 because the 1 would violate the ordering rule.
        # For (3 4) we can't split the 4 in a way where both terms
        # are at least 3.
        if ( $q >= 2*$p )
        {
            _pile($p, $q-$p, [ $soFar->@*, $p ], $result, "  $indent");
        }
        $p++; $q--;
    }
}

sub showResult($result)
{
    for my $array ($result->@*) # ( sort { $#{$a} <=> $#{$b} } $result->@* )
    {
        say "[ $array->@* ]";
    }
}

sub runTest
{
    use Test2::V0 -srand => 1;

    #is( pennyPiles(1),  1, "Test 1");
    #is( pennyPiles(2),  2, "Test 2");
    #is( pennyPiles(3),  3, "Test 3");
    #is( pennyPiles(4),  5, "Test 4");
    #is( pennyPiles(5),  7, "Example 1");
    is( pennyPiles(6), 11, "Test 6");
    is( pennyPiles(7), 15, "Test 7");
    is( pennyPiles(8), 22, "Test 8");

    done_testing;
}

