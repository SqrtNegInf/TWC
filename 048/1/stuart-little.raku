#!/usr/bin/env raku

sub surv(@a where *.elems >= 1) {
    given @a.elems {
	when * <= 2 {@a[0]}
	default {
	    (|@a[2..*], @a[0]).&surv
	}
    }
}

say (1..50).&surv; #.base(2) why?
