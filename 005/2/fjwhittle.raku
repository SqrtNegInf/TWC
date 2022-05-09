#!/usr/bin/env raku

unit sub MAIN(
  IO(Str) $file #= file containing list of words
      where { given .IO { .r && ( .l || .f) or die "Cannot read from $_" } } = 'words';
);

my SetHash %sequences{Str};

for $file.lines -> $word {
  my $seq = $word.lc.comb(/\w/).sort.join(',') and %sequences{$seq}{$word.lc}++;
}

my $maxwords = %sequences.values».elems.max;

.say for %sequences.pairs.grep: *.value.elems == $maxwords
#.fmt('%1$s(%2$d): %2$s').say for %sequences.pairs.grep: *.value.elems == $maxwords
