#!/usr/bin/env raku

my @tests = 
    ('abcd', '1234'),
    ('abc', '12345'),
    ('abcde', '123');

for @tests -> ($str1, $str2) {
    say merge-strings($str1, $str2);
}

sub merge-strings($str1, $str2) {
    my $merged = ($str1.comb Z~ $str2.comb).join;

    given $str1.chars - $str2.chars {
        return $merged ~ $str1.substr($str2.chars) when * > 0;
        return $merged ~ $str2.substr($str1.chars) when * < 0;
        return $merged;
    }
}
