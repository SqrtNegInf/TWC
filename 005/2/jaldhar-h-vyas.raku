#!/usr/bin/env raku

multi sub MAIN(
    Str $list = 'words'
) {
    my %dictionary = $list.IO.lines.map({$_ => $_.comb.sort.join });

    my %anagrams;
    for %dictionary.kv -> $key, $value {
        %anagrams{$value}.push($key);
    }

    my @keys = %anagrams
        .keys
        .sort({%anagrams{$^a}.elems <=> %anagrams{$^b}.elems})
        .reverse;

    say %anagrams{@keys[0]}.sort.join(' ');
}
