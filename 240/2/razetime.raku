#!/usr/bin/env raku
use Test;

sub ch2(@a){@a.map({@a[$_]})}

ok (ch2((0, 2, 1, 5, 3, 4)) == (0, 1, 2, 4, 5, 3)), 'Test 1';
ok (ch2((5, 0, 1, 2, 3, 4)) == (4, 5, 0, 1, 2, 3)), 'Test 2'
