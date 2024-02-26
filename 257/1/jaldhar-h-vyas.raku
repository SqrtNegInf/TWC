#!/usr/bin/env raku

#sub MAIN(*@ints) {
my @ints = (5, 2, 1, 6);
my %sorted = @ints.sort.kv.Hash.antipairs;
say q{(}, @ints.map({ %sorted{$_} }).join(q{, }), q{)};
#}
