#!/usr/bin/env raku

(1..20).map({ (($_ %% 3) && 'fizz' || '') ~ (($_ %% 5) && 'buzz' || '') || $_ }).say
