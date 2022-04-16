#!/usr/bin/env raku

srand 1;

grammar BAL {
    regex TOP { <expr>* }
    regex expr { '(' <expr>* ')' }    
}

given 6 {
    when /^\d+$/ {
	say "Random string of parens: ", my $s=<( )>.roll(6.Int).join;
	say "Balanced: ", BAL.parse($s).Bool
    }
    when /^<[()]>*$/ {
	say "Balanced: ", BAL.parse(6).Bool
    }
}
