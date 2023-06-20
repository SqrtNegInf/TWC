#!/usr/bin/env perl
use v5.36;

my $input='bookkeeper';
my @a=split "", $input;
my @b;
for (0..@a-1) { 
	my $v=$a[$_];
	state $prev=$v;
	state @stack;
	if( $v eq $prev) {
		push @stack, $v;
	}
	else {
		push @b, join "", @stack;
		@stack=();
		push @stack,$v;
	}
	$prev=$v;
	push @b, join "", @stack if $_ ==  @a-1;
};

print join("|",@b),"\n";

