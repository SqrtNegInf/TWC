#!/usr/bin/env raku

sub mrg(@a) {
    my @srta = @a.sort;
    given @a.elems {
	when * <= 1 { @srta }
	default {
	    (@srta[0;1] < @srta[1;0])
	    ?? (@srta[0], |mrg(@srta[1..*]))
	    !! (((@srta[0;0],max(@srta[0;1],@srta[1;1])), |@srta[2..*]).&mrg)
	}
    }
}

say <2,7 3,9 10,12 15,19 18,22>.map(*.split(',').map(*.Int)).&mrg
