#!/usr/bin/env perl
use v5.36;

sub bell_number ($N) {
   state $cache = [1];
   state $line = [1];
   while ($cache->$#* < $N) {
      my @previous_line = $line->@*;
      $line->@* = $previous_line[-1];
      push $line->@*, $_ + $line->[-1] for @previous_line;
      push $cache->@*, $line->[0];
   }
   return $cache->[$N];
}

printf "B%d: %d\n", $_, bell_number($_) for 0 .. 9;
