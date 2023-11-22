#!/usr/bin/env perl
use v5.36;

use builtin "indexed";
no warnings "experimental";

revPair((1, 3, 2, 3, 1));
revPair((2, 4, 3, 5, 1));

sub revPair(@arr)
{
    my @pairs;

    foreach my ($i, $iVal) (indexed @arr)
    {
        foreach my ($j, $jVal) (indexed @arr)
        {
            # just going with the debug approach, a simple counter would also suffice
            push(@pairs, [$i, $j])      if( $i < $j and $iVal > 2*$jVal);   
        }
    }

    say "Number of pairs: ", scalar @pairs;
}
