#!/usr/bin/env raku

# JVM output wrong due to gather/take issue

sub fnr(Str $s) {
	my @left;
	gather BUILD: for $s.comb -> $strch {
		@left.unshift($strch);
		for @left -> $ch {
			if @left.grep($ch).elems == 1 {
				take $ch;
				next BUILD;
			}
		}
		take '#';
	}
}

say fnr('ababcabd').join;
say fnr('xyzzyx').join;
