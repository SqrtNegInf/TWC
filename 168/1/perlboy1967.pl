#!/usr/bin/env perl

use v5.16;
use warnings;

use Math::Prime::XS qw(is_prime);

# Prototype(s)
sub perrin ($);

my %p;
my ($n,$p) = (0,1);
while ($n < 13) {
  my $pN = perrin($p++);
  if (is_prime($pN) && !exists $p{$pN}) {
    say $pN; $p{$pN}++; $n++;
  }
}
  
sub perrin ($) {
  my ($n) = @_;

  state $p = [3, 0, 2];

  return $p->[$n] if defined $p->[$n];

  $p->[@$p] = $p->[@$p-2] + $p->[@$p-3] while (!defined $p->[$n]);

  return $p->[$n];
}
