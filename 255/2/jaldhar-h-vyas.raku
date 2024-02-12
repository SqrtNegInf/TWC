#!/usr/bin/env raku

sub MAIN(
    Str $p = "Joe hit a ball, the hit ball flew far after it was hit.",
    Str $w = 'hit'
) {
    my %count;
    my @words = $p.split(/<[\s \, \.]>+/);
  
    for @words -> $word {
        %count{$word}++;
    }
    %count{$w}:delete;

    %count.keys.sort({ %count{$^b} <=> %count{$^a} }).first.say;
}
