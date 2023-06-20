#!/usr/bin/env perl
use v5.36;

use bigint;

sub ackermann {
  my ($m, $n) = @_;
  state %saved;
  $saved{$m}{$n} //= _ackermann($m, $n)
}

sub _ackermann {
  my ($m, $n) = @_;
  return $n + 1 unless $m;
  return ackermann( $m - 1, 1 ) unless $n;
  return ackermann( $m - 1, ackermann($m, $n - 1) )
}

say ackermann( 1, 2 );
say ackermann( 2, 4 );
