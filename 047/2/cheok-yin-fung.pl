#!/usr/bin/env perl
use v5.36;

my $th;

my $c = 0; 

for my $N (100..999) {

	$th = 10 * int($N / 100) + ($N % 10);

	if ($N % $th == 0) {$c++; print $c, ". ", $N , "\n";}

	if ($c==20) {exit;}
}


for my $N (1000..9999) {

	$th = 10 * int($N / 1000) + ($N % 10);

	if ($N % $th == 0) {$c++; print $c, ". ", $N , "\n";}

	if ($c==20) {exit;}
}
