#!/usr/bin/env raku

#unit sub MAIN (*@words where @words.elems > 1 && all(@words) ~~ /^<[a..zA..Z]>+$/, :v(:$verbose));
my @words = ("love", "live", "leave");

my $set = [(&)] @words>>.lc>>.comb;

say '(' ~ $set.keys.sort.map({ '"' ~ $_ ~ '"' }).join(", ") ~ ')';
