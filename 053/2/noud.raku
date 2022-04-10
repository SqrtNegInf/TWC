#!/usr/bin/env raku

my %rules = 'a' => ['e', 'i'],
            'e' => ['i'],
            'i' => ['a', 'e', 'o', 'u'],
            'o' => ['a', 'u'],
            'u' => ['o', 'e'];

sub vowel-strings($n) {
    if ($n == 1) {
        return [['a'], ['e'], ['i'], ['o'], ['u']];
    }

    my @ret = [];
    for vowel-strings($n - 1) -> @a {
        for %rules{@a[*-1]}[*;*] -> $e {
            @ret.push([|(@a), $e]);
        }
    }
    return @ret;
}

sub MAIN($n=3) {
    $_.say for vowel-strings($n).map({.join});
}
