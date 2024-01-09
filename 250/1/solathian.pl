#!/usr/bin/env perl
use v5.36;

use builtin qw(indexed);
no warnings "experimental";

small(0,1,2);                           # 0
small(4, 3, 2, 1);                      # 2
small(1, 2, 3, 4, 5, 6, 7, 8, 9, 0);    # -1

sub small(@array)
{
    my $returnVal = -1;

    foreach my ($index, $elem) (indexed @array)
    {
        if($index % 10 == $elem)
        {
            $returnVal = $index;
            last;
        }
    }
    
    say $returnVal;
    return $returnVal;
}
