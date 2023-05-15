#!/usr/bin/env raku

#unit sub MAIN (:w(:$word) where $word.chars >= 1 && $word ~~ /^<[a..z]>+$/;
#               *@stickers where @stickers.elems > 0 && all(@stickers) ~~ /^<[a..z]>+$/,
#               :v(:$verbose));

my $word = 'peon';
my @stickers = <perl raku python>;

my @word = $word.comb;

for (@stickers xx $word.chars).flat.combinations(1 .. Inf).unique(:as(&bag)) -> @combination
{
  my $stickers = @combination.elems;
  my @stickers = @combination.join.comb;

  if @word.Bag (<=) @stickers.Bag
  {
    say $stickers;
    exit;
  }
}

say 0;

