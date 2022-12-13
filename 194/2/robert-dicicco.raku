#!/usr/bin/env raku

# disagrees with 0rir.raku

use List::UtilsBy qw/max_by min_by/;

my @ss = ("abbc", "xyzyyxz", "xzxz", 'aaicocciaoouiacio');
my $x = 0;
my %seen = ();

for (@ss) -> $s {
  say "Input: \$s = \'$s\'";
  my $ln = $s.chars;
  while $x < $ln  {
    my $zsub = substr($s,$x,1);
    %seen{$zsub} += 1;
    if ($x < $ln) {$x++};
    my $highest = max()
  }
  my $highest = max_by Scalar, { %seen{$_}}, keys %seen;
  my $lowest  = min_by Scalar, { %seen{$_}}, keys %seen;
  (%seen{$lowest} + 1 == %seen{$highest}) ?? say "Output: 1\n" !! say "Output: 0\n";
  $x = 0;
  %seen = ();
}
