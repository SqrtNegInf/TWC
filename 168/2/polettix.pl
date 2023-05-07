#!/usr/bin/env perl
use v5.36;

use ntheory qw< factor >;

my $n = shift // 10;
say home_prime($n);

sub home_prime {
   my $next = join '', factor($_[0]);
   return $next if $next eq $_[0];
   $_[0] = $next;
   goto &home_prime;
}
