#!/usr/bin/env perl
use v5.36;
no warnings 'uninitialized';

use List::Util qw(all pairmap);


my @input=my @rest=sort {$a <=> $b} <1 2 3 6 7 9>; # make sure list is sorted and make copies
my $previous=my $first=shift @rest;
say join " ", @input, "->",
    pairmap {"[$a, $b]"}
    map{subseq($_)} @rest, undef; # finish inputs with undef

sub subseq($current){ # identify and output complete contiguous subsequences
    my @output = $first<$previous ? ($first, $previous): ();
    return @output if
        !defined $current      # input is consumed
	&& $first < $previous; # and a range has been found
    $previous = $current, return () if $current==$previous+1; # not done yet
    $first=$previous=$current; # prepare next sequence
    return @output;
}
