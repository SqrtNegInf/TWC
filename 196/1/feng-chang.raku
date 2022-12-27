#!/usr/bin/env raku

my @N = (3,1,4,2);

put @N[(^+@N X ^+@N X ^+@N).grep({ .[0] < .[1] < .[2] }).first({ @N[.[0]] < @N[.[2]] < @N[.[1]] }) // []].gist;
