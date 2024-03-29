#!/usr/bin/env perl
use v5.36;

srand 1;

my $max=10;
my @N= sort map { int rand $max } 1..$max;
my $k=8;

say "Input Array:";
say join ", ", @N;

my @results;

for (my $i=0; $i<@N; $i++) {
	for (my $j=0; $j<@N; $j++) {
		push @results,[$i,$j] if $N[$i]-$N[$j] == $k and $i != $j;
	}
}
say "Index pairs for difference of $k:";
printf("%d, %d\n",$_->[0],$_->[1]) for @results;

