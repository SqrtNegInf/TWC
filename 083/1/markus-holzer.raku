#!/usr/bin/env raku
unit sub MAIN( Str $S = 'Markmið lífs okkar er að vera hamingjusöm' );
$S.words[ 1 .. *-2 ].join.chars.say
