#!/usr/bin/env raku

say max <1 3 8 2 0>.map(*.Int).sort.rotor(2 => -1).map({ $_[1]-$_[0] }).max, 0
