#!/usr/bin/env raku

my $order = 1; my @values = (5, 9, 2, 8, 1, 6);
	@values=(5, 9, 2, 8, 1, 6 ) if !@values;
	@values= map( { [-] @values[$_,$_-1]}, @values.keys[1..*-1]) for ^$order ;
	put @values;
