#!/usr/bin/env raku

use Test;

my @Test =
    # source                target      set      bag 
    "aabbcc",               "abc",      True,   True,
    "scriptinglanguage",    "perl",     True,   True,
    "abc",                  "xyz",      False,  False,
    'a',                    'a',        True,   True,
    'aa',                   'a',        True,   True,
    'aa',                   'aa',       False,  True,
    'aa',                   'ab',       False,  False,
;
plan @Test ÷ 2;

sub func( $src, $trg, Bool :$bag -->Bool) {
    my ($s, $t) = ($src.comb.Bag, $trg.comb.Bag);
    return $t ⊆ $s if $bag;
    return $t ⊆ $s.Set;
}

for @Test -> $src, $trg, $set, $bag {
    is func($src, $trg      ), $set, "$trg <- $src (set)";
    is func($src, $trg, :bag), $bag, "$trg <- $src (bag)";
}
done-testing;

my $source = 'apple';
my $dest   = 'leap';
say qq{\n\$source = "$source"\n\$target = "$dest"};
say "Output: &func($source, $dest)             set required";
$dest = 'apple';
say qq{\n\$source = "$source"\n\$target = "$dest"};
say "Output: &func($source, $dest)             set required";
say qq{\n\$source = "$source"\n\$target = "$dest"};
say "Output: &func($source, $dest, :bag)          dupes per source";
