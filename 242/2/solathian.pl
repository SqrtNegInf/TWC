#!/usr/bin/env perl
use v5.36;

#use Data::Dumper;
use Data::Dump qw(dump);

flip( [[1, 1, 0], [1, 0, 1], [0, 0, 0]]);                         # ([1, 0, 0], [0, 1, 0], [1, 1, 1])
flip( [[1, 1, 0, 0], [1, 0, 0, 1], [0, 1, 1, 1], [1, 0, 1, 0]]);  #([1, 1, 0, 0], [0, 1, 1, 0], [0, 0, 0, 1], [1, 0, 1, 0])

sub flip($listRef)
{
    foreach my $rowRef (@$listRef)
    {
        @$rowRef = map{($_ == 0) ? 1 : 0 } reverse @$rowRef;
    }
    
    say dump $listRef;
}
