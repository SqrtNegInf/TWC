#!/usr/bin/env raku

multi MAIN { MAIN(3,6) };
multi MAIN(Int $A, $B where $A > 1 && $B >= $A) {
	my $input_file = 'input.txt';
	my $line_count = 0;

	for $input_file.IO.lines -> $line {
		$line_count++;
		say $line
			if ($line_count >= $A && $line_count <= $B);
	}
}
