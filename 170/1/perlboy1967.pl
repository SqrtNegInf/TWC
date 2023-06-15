#!/usr/bin/env perl
use v5.36; # example with and without prototypes

use Math::Primality qw(next_prime);

# Prototype(s)
sub primorialNumber :prototype($\@);

my @p;
printf "%d\t=> %d\t(%s)\n", $_, primorialNumber($_, @p), join(',',@p) for 0..15;
say '---';
printf "%d\t=> %d\t(%s)\n", $_, primorialNumber_noproto($_, \@p), join(',',@p) for 0..15;

sub primorialNumber :prototype($\@) {
  my ($i,$j) = @_;

  state $p = [1];
  state $n = [1];

  while (@$n <= $i) {
    push(@$p, next_prime($p->[-1]));
    push(@$n, $p->[-1] * $n->[-1]);
  }

  @$j = @$p[0 .. @$p-1];

  return $n->[$i];
}

sub primorialNumber_noproto {
  my ($i,$j) = @_;

  state $p = [1];
  state $n = [1];

  while (@$n <= $i) {
    push(@$p, next_prime($p->[-1]));
    push(@$n, $p->[-1] * $n->[-1]);
  }

  @$j = @$p[0 .. @$p-1];

  return $n->[$i];
}
