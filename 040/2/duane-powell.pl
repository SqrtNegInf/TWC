#!/usr/bin/env perl
use v5.36;

my @a = qw( 10 4 1 8 12 3 );
my @i = qw( 0 2 5);


say join(',',@a);
my @temp;
foreach (@i) {
	push @temp, $a[$_];
}
@temp = sort {$a <=> $b} @temp;
foreach (@i) {
	$a[$_] = shift @temp;
}
say join(',',@a);
