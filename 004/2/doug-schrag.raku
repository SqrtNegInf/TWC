#!/usr/bin/env raku

my $file = 'words';
my @letters = <c r a t e>;
    say @letters;
    my $file-handle = .IO with $file;
    $file-handle ||= $*IN;
    my $tiles = Bag.new(@letters>>.fc);
    for $file-handle.lines>>.fc -> $word {
        $word.comb.Bag (<=) $tiles
            and say $word;
    }
