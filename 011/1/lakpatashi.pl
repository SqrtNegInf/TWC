#!/usr/bin/env perl
use v5.36;

my $stepF = 1.8;

my $f = -148;
print "F:\tC\n";
for (my $c=-100;$c <= 100; $c++ ){
	print int $f,": $c\n" if $f==$c;
	$f = sprintf "%.1f", $f+$stepF;
}


