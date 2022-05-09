#!/usr/bin/env raku

sub MAIN(Str:D $filename = 'words') {
    my $matchbag = Bag.new('animal'.comb);
    my SetHash $dedupe = SetHash.new;  # To store matches we gave back

    for $filename.IO.lines -> $word {
        my $fcword = $word.fc;

        my $bag = Bag.new($fcword.comb);

        if $bag ~~ $matchbag {
            next if $fcword ∈ $dedupe;
            $dedupe{$fcword}++;
            say $fcword;
        }
    }
}

