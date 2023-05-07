#!/usr/bin/env perl
use v5.36;
use ntheory 'next_prime';

my $it = primorial_it();
say $it->() for 1 .. shift || 10;

sub primorial_it ($n = 1, $p = 1) {
 # sub { (($p, $n) = ($p * $n, next_prime($n)))[0] };
   sub { ($p, $n) = ($p * $n, next_prime($n)); $p };
}
