#!/usr/bin/env raku

sub MAIN(Str $string = "The quick brown fox jumps over the lazy dog") {
    my @new_words;
    @new_words[$_] = '' for (0..7);

    my $clean_string = $string;
    $clean_string ~~ s:g/\s//;
    my @chars = $clean_string.comb;

    for (0 .. @chars.elems - 1) -> $i {
        @new_words[$i % 8] =
            @new_words[$i % 8] ~ @chars[$i];
    }

    say @new_words.join(' ');
}
