#!/usr/bin/env perl
use v5.36;

my @A = (1, 2, 3, 6, 7, 8, 9);

say "Input: (", join(", ", @A),")\nOutput: ([",
    join("], [",
    (map {join ", ", @$_}
         consecutives(sort {$a<=>$b} @A))), "])";

sub consecutives { # Return array of arrays of consecutive integers
    my @in=@_; # assume they are integers.
    my @out;
    while(@in){
	my $c=shift @in;
	my @seq=($c);
	push @seq, shift @in while(@in && $in[0]==++$c);
	push @out, [@seq];
    }
    return @out;
}
