#!/usr/bin/env raku

my %*SUB-MAIN-OPTS=:named-anywhere,;
sub MAIN(
    Str $word = 'animal',
    Str $path_to_dict_file = 'words',
) {
    say anagrams($word, $path_to_dict_file.IO.slurp.words)
}

sub anagrams($word,@words) {
    my $bag=$word.lc.comb.Bag;
    return @words.grep({ $_.lc.comb.Bag === $bag })
}
