#!/usr/bin/env raku
(^(+@*ARGS[0] || die 'Invalid number supplied')).grep(*.is-prime).elems.say;
