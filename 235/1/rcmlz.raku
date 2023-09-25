#!/usr/bin/env raku

my $REPLACEMENTS = 1;

our proto solution(@input, $replacements=$REPLACEMENTS) is export {*}

multi solution(@input where @input.unique.elems < @input.elems - 1, $replacements=$REPLACEMENTS){ False }

multi solution(@input where @input.elems < 2, $replacements=$REPLACEMENTS){ True }

multi solution(@input where @input.elems == 2, $replacements=$REPLACEMENTS){ 
	$replacements || @input[0] < @input[1] ?? True !! False
}

multi solution(@input, $replacements=$REPLACEMENTS) {
	for 1..^@input.elems -> $i {

		if @input[$i - 1] >= @input[$i] {

			return False if $replacements < 1;
			
			my @part1 = @input.clone;
			my @part2 = @input.clone;
				
			@part1.splice($i,1);
			@part2.splice($i - 1,1);

			return samewith(@part1, $replacements - 1) || samewith(@part2, $replacements - 1);			
		}
	}
	return True
}

say solution( (0, 2, 9, 4, 6) ) ;
