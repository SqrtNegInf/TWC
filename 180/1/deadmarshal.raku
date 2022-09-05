#!/usr/bin/env raku
sub first_unique_character($s)
{
  my @chars = $s.split('');
  my %hash;
  %hash{$_}++ for @chars;
  for 0..@chars.elems -> $i
  {
    if (%hash{@chars[$i]} == 1)
    {
      return sprintf "%d as '%s' is the first unique character",
      $i-1,
      @chars[$i];
    }
  }
}

sub MAIN(Str $str = 'raku Yearly Challenge')
{
  say first_unique_character($str);
}
