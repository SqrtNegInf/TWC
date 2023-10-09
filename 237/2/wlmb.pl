#!/usr/bin/env perl
use v5.36;

my @ARGV = (1, 3, 5, 2, 1, 3, 1);
die <<~"FIN" unless @ARGV;
    Usage: $0 N1 [N2...]
    to find the greatness of the array N1 N2...
    FIN
my @copy=my @sorted=sort {$a<=>$b} @ARGV;
my $current=shift @sorted;
my @permutation;
while(@copy){
    my $next=shift @copy;
    push(@permutation, $next), $current=shift @sorted if $current<$next
}
say "@ARGV -> ", 0+@permutation;
