#!/usr/bin/env raku

my %*SUB-MAIN-OPTS=:named-anywhere,;

sub MAIN(
    Str $path_to_dict_file = 'words',
) {
    say $path_to_dict_file.IO.words.classify({ $_.lc.comb.Bag }).max({ $_.value.elems }).value
}
