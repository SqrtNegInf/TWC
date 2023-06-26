#!/usr/bin/env raku

# can't use '-1' as suffix?
sub matching-members1 (Positional(Int()) $list) { ($list «==» $list.sort).sum }
sub matching-members2 (Positional(Int()) $list) { ($list «==» $list.sort).grep({$_}).elems }

put matching-members1( (1, 1, 4, 2, 1, 3) );
put matching-members2( (1, 1, 4, 2, 1, 3) );
