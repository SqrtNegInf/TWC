#!/usr/bin/env raku

#| Find words in a file that contain only the given letters
unit sub MAIN(
  Str $file = 'words',
  @letters  = <c r a t e>
);

my $letter-bag := @letters.map(*.lc.comb(/ \w /)).flat.Bag;

my @words = $file.IO.lines.unique.grep(*.chars > 2)
                 .map: { .lc.comb(/ \w /).Bag => $_ };

@words.grep(*.key ⊆ $letter-bag)».value.unique(with => *.lc eq *.lc).join(', ').put;
