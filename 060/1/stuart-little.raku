#!/usr/bin/env raku

sub trcol(Str $s) {
    my @cols=(|('A'..'Z'), |(2..*).map({ |(['A'..'Z'] xx $_).reduce(&infix:<X~>) }));
    given $s {
	when /^<[a..zA..Z]>+$/ {
	    @cols.first({ $_ eq $s.uc }, :k)+1
	}
	when /^\d+$/ {
	    @cols.[$s.Int-1]
	}
    }
}

say '28'.&trcol
