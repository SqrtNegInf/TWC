#!/usr/bin/env perl
use v5.36;

use Algorithm::Combinatorics qw(permutations);
use List::AllUtils qw(uniq onlyidx);
my @ARGV = 'CAT';
die <<~"FIN" unless @ARGV;
    Usage: $0 W1 [W2...]
    to find the dictionary rank of words W1 W2...
    FIN
for(@ARGV){
    my @letters=split "", my $word=lc;
    say "$_ => ", 1+onlyidx {$_ eq $word}
         sort{$a cmp $b}
         uniq
	 map {join "", @$_}
         permutations(\@letters);
}
