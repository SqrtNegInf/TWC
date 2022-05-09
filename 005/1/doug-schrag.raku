#!/usr/bin/env raku

subset Filename of Str;
sub MAIN(Str $word = 'animal', Filename :$word-file  = 'words') {
    my $file = .IO with $word-file;
    my Set $words = Set.new(.lines.sort) with $file;
    if $words.defined {
        .say for anagrams($word, -> $w { $w (elem) $words });
    }
    else {
        note 'Please supply word dictionary using --word-file option';
        say 'All permutations:';
        .say for anagrams($word);
    }
}


sub anagrams ($word, &is-word = -> $w { True }) {
    gather
    for $word.comb.permutations.unique(:with(&[eqv])) {
        with .join {
            .take if .&is-word
        }
    }
}
