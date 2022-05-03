#!/usr/bin/env raku

sub F($n) { $n==0 && return 1; return $n - M(F($n-1)) }

sub M($n) { $n==0 && return 0; return $n - F(M($n-1)) }

my $n=19;

say "F: ", F($n);
say "M: ", M($n);
