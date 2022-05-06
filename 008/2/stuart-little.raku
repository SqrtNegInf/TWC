#!/usr/bin/env raku

sub center(@a) { my $mlen=@a.map(*.chars).max; @a.map({ " " x (($mlen-$_.chars) div 2) ~ $_ }) }

for ('This', 'is', 'a test of the', 'centre function').&center {.say}
