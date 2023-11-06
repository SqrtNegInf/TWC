#!/usr/bin/env raku

our sub solution([$diff, *@input]) is export {
	my UInt $counter = 0;
	my UInt \n = @input.elems;

	for ^n -> \i {
	  for i+1..^n -> \j {
		if @input[j] - @input[i] == $diff {
	  		for j+1..^n -> \k {
    			$counter++ if @input[k] - @input[j] == $diff
	  		}
		}
	  }
    }
    $counter
}

say solution (3,  (0, 1, 4, 6, 7, 10));
