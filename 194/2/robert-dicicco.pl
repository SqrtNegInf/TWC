#!/usr/bin/env perl
use v5.36;
use List::UtilsBy qw(max_by min_by);

my %seen = ();

my @ss = (("abbc"), ("xyzyyxz"), ("xzxz"));
my $x = 0;

foreach my $s (@ss) {
  say "Input: \$s = $s";
  my $ln = length($s);
  while( $x < $ln ) {
    my $zsub = substr($s,$x,1);
    $seen{$zsub} += 1;
    if ($x < $ln) {$x++};
  }

  my $highest = max_by { $seen{$_} } keys %seen;
  my $lowest  = min_by { $seen{$_} } keys %seen;

  ($seen{$lowest} + 1 == $seen{$highest}) ? say "Output: 1" : say "Output: 0";
  say "------------------------------";
  $x = 0;
  %seen = ();
}
