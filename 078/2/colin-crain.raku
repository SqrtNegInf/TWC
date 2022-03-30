#!/usr/bin/env raku

unit sub MAIN (Str $arraystr = "7,4,2,6,3", Str $idxstr = "1,3,0,4") ;

## in
my @array = $arraystr.split(',');
my @idxs  = $idxstr.split(',');
my @output;

## work
for @idxs -> $idx {
    $idx == 0 and do { @output.push: @array; next };
    @output.push: @array[|($idx..@array.end), |^$idx]; 
}

## out
say "array:       ", @array;
say "index list:  ", @idxs;
say "output:\n";
.say for @output;
