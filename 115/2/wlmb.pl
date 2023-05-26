#!/usr/bin/env perl
use v5.36;

use List::MoreUtils qw(first_index);
my @ARGV = <4176 1026 1357>;
foreach(@ARGV){
    die "Usage: ./ch-2.pl digits1 [digits2...]"
         unless m/^\d+$/;
    say "Input: $_";
    my @digits=sort {$a<=>$b} split '', $_;
    my $even_index=first_index {$_%2==0} @digits;
    say("No even number may be constructed from input"), next
         unless $even_index>=0;
    my $last=splice @digits, $even_index,1;
    say "Output: ", reverse(@digits), $last;
}
