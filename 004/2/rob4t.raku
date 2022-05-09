#!/usr/bin/env raku

sub MAIN ( Str $file where *.IO.r = 'words', @letters where { .elems > 0 and .all ~~ /^^<:L>$$/ } = <c r a t e>  ) {
    my $letterbag = @letters.map({ .comb[0].lc }).Bag;
    my @words = $file.IO.lines( :chomp ).map({ .words[0].lc });
    for @words -> $word {
        say $word if $word.comb.Bag ⊆ $letterbag;
    }
}
