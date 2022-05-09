#!/usr/bin/env raku

sub pscl($n) { $n==1 && return ((1,),); my @a=pscl($n-1); return(|@a, (1, |(@(@a.[*-1]) Z+ @(@a.[*-1].[1..*])) ,1)) }

sub pprnt(@a) { @a.map(*.join(" ")) }

for 10.&pscl.&pprnt {.say}
