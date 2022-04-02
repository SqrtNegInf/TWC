#!/usr/bin/env raku

my @numbers = (7, 8, 3, 12, 10);
@numbers.kv.map( -> $i, $v { my $m = @numbers[0..$i].min; $m < $v ?? $m !! 0 } ).say;   
