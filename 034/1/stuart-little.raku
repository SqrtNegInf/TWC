#!/usr/bin/env raku

my %h=(
    one => 1,
    two => 2,
    three => 3,
    four => 4,
);

say "A hash: ", %h.raku;
say "Slicing the hash to an array: ", %h.<one three>;
say "Slicing the hash to a slice: ", <one three>.map({ $_ => %h{$_} }).Hash.raku;
