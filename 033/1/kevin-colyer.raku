#!/usr/bin/env raku

use Test;

sub count($text) {
    return BagHash.new( $text.lc.comb.grep: * ~~ / <alpha> / );
}

multi MAIN(*@files) {
    my BagHash $bag;
    for @files -> $f {
        next unless $f.IO:f;
        $bag{.key}+=.value for count($f.IO.slurp); # Add returned bag to bag hash
    }
    $bag{"_"}:delete;
    say "$_: {$bag{$_}}" for $bag.keys.collate;
}

#multi MAIN("test") {
    my $i=BagHash.new(<a b b>);
    my $j=BagHash.new(<á b b>);
    is-deeply count("abb"),$i,"test counts";
    is-deeply count("Abb"),$i,"test lowercase";
    is-deeply count("Ább"),$j,"test lowercase2";
    is-deeply count("a 1 b\n.b!"),$i,"test not counting non-words";
#}
