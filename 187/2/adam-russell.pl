#!/usr/bin/env perl

# DH fix sorting of output

use v5.36;
use Hash::MultiKey;
use Math::Combinatorics;

sub magical_triples{
    my(@numbers) = @_;
    my %triple_sum;
    tie %triple_sum, q/Hash::MultiKey/;
    my $combinations = Math::Combinatorics->new(count => 3, data => [@numbers]);
    my($s, $t, $u);
    while(my @combination = $combinations->next_combination()){
        my($s, $t, $u) = @combination;
        my $sum;
        $sum = $s + $t + $u if $s + $t > $u && $t + $u > $s && $s + $u > $t;
        $triple_sum{[$s, $t, $u]} = $sum if $sum;
    }
    my @triples_sorted = sort {$triple_sum{$b} <=> $triple_sum{$a}} keys %triple_sum; 
    return sort { $b <=> $a } ($triples_sorted[0]->[0], $triples_sorted[0]->[1], $triples_sorted[0]->[2]) if @triples_sorted;
    return ();
}

MAIN:{
    say "(" . join(", ", magical_triples(1, 2, 3, 2)) . ")";
    say "(" . join(", ", magical_triples(1, 3, 2)) . ")";
    say "(" . join(", ", magical_triples(1, 1, 2, 3)) . ")";
    say "(" . join(", ", magical_triples(2, 4, 3)) . ")";
}
