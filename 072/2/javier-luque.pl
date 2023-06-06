#!/usr/bin/env perl
use v5.36;

my $A = shift // 3;
my $B = shift // 6;

die ("$B needs to be >= than $A")
	unless ($A > 1 && $B >= $A);

my $input_file = 'input.txt';

open my $fh, '<', $input_file or die "$input_file: $!";
while( <$fh> ) {
	if( $. >= $A && $. <= $B ) {
		print $_;
	}
}

close $fh;
