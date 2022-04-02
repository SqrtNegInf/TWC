#!/usr/bin/env raku


unit sub MAIN (Int $S where $S > 0 = 3, @A= (1, 5, 0, 2, 9, 3, 7, 6, 4, 8) );

## default array
@A = 1, 5, 0, 2, 9, 3, 7, 6, 4, 8 if @A.elems == 0;

## make windows and find min within each to output
my @windows = @A.rotor($S=>-$S+1);
my @output = @windows.map( *.min );

## output 
say "input:   ", @A, "    window size $S";
say "windows: ", |@windows;
say "output:  ", @output;

