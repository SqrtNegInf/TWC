#!/usr/bin/env raku
^100 .grep(*.is-prime).elems.say;
