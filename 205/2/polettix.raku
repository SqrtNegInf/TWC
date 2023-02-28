#!/usr/bin/env raku

my @args = (13,13,9,1); 
put maximum-xor(@args); 
put maximum-xor2(@args); 

sub maximum-xor (@array) { @array .combinations(2) .map({[+^] $_}) .max }
sub maximum-xor2 (@a) { @a.combinations(2).map(->($x,$y){$x +^ $y}).max }
