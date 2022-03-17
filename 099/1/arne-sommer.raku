#!/usr/bin/env raku

unit sub MAIN (Str $S where $S.chars > 0 = 'abcde',
               Str $P is copy where $P.chars > 0 = 'a*e',
	       :v(:$verbose));

$P.=trans( [ '*', '?' ] => [ '.*' , '.' ]);

say ": Regex: $P " if $verbose;

say $S ~~ /^ <$P> $/ ?? 1 !! 0
