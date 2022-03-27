#!/usr/bin/env raku

unit sub MAIN (Str $S where $S.words.elems >= 3 = 'Markmið lífs okkar er að vera hamingjusöm',
               :v($verbose));

say $S.chars;
say '--';

my @words = $S.words;
my $s     = @words[1.. @words.end -1].join;

say ": '{ $s }'";# if $verbose;

say $s.chars;
