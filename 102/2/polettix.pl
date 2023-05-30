#!/usr/bin/env perl
use v5.36;

sub hash_counting_string ($N) {
   my $retval = '';
   ($retval, $N) = ("$N#$retval", $N - 1 - length $N) while $N > 1;
   return $N == 1 ? "#$retval" : $retval;
}

my $n = shift || 120;
say hash_counting_string($n);
