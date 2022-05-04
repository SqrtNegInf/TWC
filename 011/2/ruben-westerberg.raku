#!/usr/bin/env raku
my $s=@*ARGS[0]//5;
(([1,|(0 xx $s-1)].rotate: -$++)  xx $s).map: *.join(" ").say;

