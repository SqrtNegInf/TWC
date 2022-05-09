#!/usr/bin/env raku

multi sub MAIN(
    Str $word = 'animal', #= Find anagrams for this word.
    Str $list = 'words'
) {
    my $search = $word.comb.sort.join; 
    my %dictionary = $list.IO.lines.map({ $_ => $_.comb.sort.join });

    my %anagrams;
    for %dictionary.kv -> $key, $value {
        %anagrams{$value}.push($key);
    }

    if (%anagrams{$search}:exists) {
        say %anagrams{$search}.grep({ $_ !~~ $word }).sort.join(' ');
    }
}
