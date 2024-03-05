#!/usr/bin/env raku

#unit sub MAIN (Int $k, *@ints where @ints.elems > 0 && all(@ints) ~~ Int, :v(:$verbose));
my $k = 1;
my @ints = (2, 5, 9, 11, 3);

my $output = 0;

for ^@ints.elems -> $index
{
  my $binary = $index.fmt('%b');
  my $sum    = $binary.comb.sum;

  if $sum == $k
  {
    $output += @ints[$index];
  }
  #elsif $verbose
  #{
  #  say ":Index $index binary $binary -> $sum";
  #}
}

say $output;
