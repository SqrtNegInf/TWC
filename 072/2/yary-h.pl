#!/usr/bin/env perl
use v5.36;

my ($begin_line, $end_line)=(3,6);

# Not using flip-flop .. want to simply exit on the end line
while (<DATA>) {
	next if $. < $begin_line;
	print;
	exit if $. >=$end_line;
}

__END__
L1
L2
L3
L4
L5
L6
L7
L8
L9
