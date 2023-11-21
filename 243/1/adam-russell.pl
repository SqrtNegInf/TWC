#!/usr/bin/env perl
use v5.36;

sub reverse_pairs{
    my @integers = @_;
    my @reverse_pairs;
    do{
        my $i = $_;
        do{
            my $j = $_;
            push @reverse_pairs, [$i, $j] if $integers[$i] > $integers[$j] + $integers[$j];
        } for $i + 1 .. @integers - 1;
    } for 0 .. @integers - 1;
    return 0 + @reverse_pairs;
}

MAIN:{
    say reverse_pairs 1, 3, 2, 3, 1;
    say reverse_pairs 2, 4, 3, 5, 1;
}
