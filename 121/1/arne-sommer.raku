#!/usr/bin/env raku

#unit sub MAIN (Int $m where 0 <= $m <= 255, Int $n where 1 <= $n <= 8, :v(:$verbose));

my ($m, $n)  =  12, 3;

my $mask   = 2 ** ($n -1);
my $result = $m +^ $mask;

if True
{
  say ": Binary: { $m.fmt('%08b') }";
  say ": Mask:   { $mask.fmt('%08b') }";
  say ": XOR:    { $result.fmt('%08b') }";
}

say $result;
