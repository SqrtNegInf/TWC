#!/usr/bin/env raku

sub MAIN($sentence = 'Perl Weekly Challenge', $badkeys  = 'l') {
    say $sentence.fc.words.grep({!(.comb ∩ $badkeys.fc.comb)}).elems;
}
