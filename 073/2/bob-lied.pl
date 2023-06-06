#!/usr/bin/env perl
use v5.36;

my @A = (7, 8, 3, 12, 10);

sub smallestNeighbor
{
    my ($arr) = @_;
    my @result = (0);   # First result is always zero

    my $smallest = shift(@$arr);
    while ( scalar(@$arr) )
    {
        my $p = shift(@$arr);
        if ( $smallest < $p )
        {
            push @result, $smallest;
        }
        else
        {
            $smallest = $p;
            push @result, 0;
        }
    }

    return @result;
}

say "(", join(",", smallestNeighbor(\@A) ), ")";
