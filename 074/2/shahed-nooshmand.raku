#!/usr/bin/env raku
([\,] 'ababcabd'.comb).map({ .grep({ .grep($^c) == 1 })[*-1] // '#' }).join.say
