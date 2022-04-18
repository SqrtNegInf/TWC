#!/usr/bin/env raku

srand 1;

my %points = {
    1 => "AGISUXZ".comb,
    2 => "EJLRVY".comb,
    3 => "FDPW".comb,
    4 => "BN".comb,
    5 => "TOHMC".comb,
    10 => "KQ".comb,
}.invert;

my %num_tiles = {
    2 => "XKQ".comb,
    3 => "GJLRVDOH".comb,
    4 => "NMC".comb,
    5 => "IUZYPWBT".comb,
    7 => "S",
    8 => "A",
    9 => "E",
}.invert;

my @tileset;
for %num_tiles.kv -> $key, $value {
    for 1..$value -> $i {
        @tileset.push($key);
    }
}

sub get_best_word(%picked) {
    my @picked_words;
    for "words".IO.slurp.uc.words -> $word {
        if ($word.comb ⊆ %picked) {
            @picked_words.push(((%points{$_} for $word.comb).sum, $word));
        }
    }

    sort(@picked_words)[*-1];
}

sub MAIN() {
    my @picked = 'PALKMEN'.comb; #@tileset.pick(7);
    say "Picked tiles: " ~ @picked;
    say "Best word: " ~ get_best_word(@picked.Bag);
}
