#!/usr/bin/env raku
sub MAIN(UInt $N =377) { 
	my @answers =	
		(1, 1, * + * ...^ *>= $N)[1..*]		#Fibonacci numbers >= $N (slice off duplicated 1)
		.combinations						#... all possible combinations
		.grep({.sum == $N});				#... which add to $N

	say +@answers ?? @answers.join("\n") !! 0;
}
