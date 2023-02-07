#!/usr/bin/env raku

# NB: DH wrote this in the style of the Perl by Peter C-S.

my @tests = ([1, 5, 3, 6], [2, 6, 3, 5], [1, 2, 3, 4], [2, 3, 5, 7], [1, 11, 111], [2, 22, 222]);

for @tests -> $test {
	say "\nInput: @array = ({$test.join(', ')})";
	say 'Output: ' ~ (($test.map: * +& 1 ).join: '') ~~ m|'111'|.so;
}	
