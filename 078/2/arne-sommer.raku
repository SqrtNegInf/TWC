#!/usr/bin/env raku

#unit sub MAIN (Str $A, Str $B);

my @A = (10,20,30,40,50); my @B = (3,4);

die '@A must be positive numbers only' unless all(@A) > 0;
die '@B must be legal indices only'   unless 0 <= all(@B) <= @A.end;

@B.map({ say '[' ~ @A.rotate($_).join(' ') ~ ']' });
