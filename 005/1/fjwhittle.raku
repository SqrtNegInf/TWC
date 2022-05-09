#!/usr/bin/env raku

unit sub MAIN(
  Str $file #= file containing list of words
          where { given .IO { .r && ( .l || .f) or die "Cannot read from $_" } } = 'words',
  $word = 'animal'
);

my $word-bag := $word.lc.comb(/ \w /).Bag;

my @words = $file.IO.lines.unique.grep(*.chars > 2)
                 .map: { .lc.comb(/ \w /).Bag => $_ };

@words.grep(*.key === $word-bag)».value.unique(with => *.lc eq *.lc).join(', ').put;
#@words.race.grep(*.key === $word-bag)».value.unique(with => *.lc eq *.lc).join(', ').put;
