#!/usr/bin/env raku

multi sub MAIN(
    Str $letters = 'crate'
) {
    my $contents = "words".IO.slurp;
    my @words = $contents.lines;

    for @words -> $word {
        my $upword = $word.uc;  # converting word and letter list to upper case
        my $used = $letters.uc; # for case-insensitive comparisons.
        my Bool $bogus = False;

        for $upword.comb -> $letter {
            if ($used !~~ s/$letter//) {
                $bogus = True;
                last;
            }
        }

        if (!$bogus) {
            say $word;
        }
    }
}
