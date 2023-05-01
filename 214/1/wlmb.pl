#!/usr/bin/env perl

use v5.36;
my @scores=(2,5,2,1,7,5,1);
my @ranks=(qw(Gold Silver Bronce), 4..@scores); # G S B 4 5 6...
my $counter;
my %score_to_rank;
map {my $current=$ranks[$counter++]; $score_to_rank{$_}//=$current}
    sort {$b<=>$a} @scores;
say join " ", @scores, "->", @score_to_rank{@scores}
