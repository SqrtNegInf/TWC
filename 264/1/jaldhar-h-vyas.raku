#!/usr/bin/env raku

my $str = 'PeRlwEeKLy';
$str.comb.classify({ $_ ~~ 'A' .. 'Z' ?? 'upper' !! 'lower'}, :into(my %chars));
say (%chars<upper>.values ∩ %chars<lower>.values.map({ .uc })).keys.sort[*-1] // q{''};
