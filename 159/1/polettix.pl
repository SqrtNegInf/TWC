#!/usr/bin/env perl
use v5.36;

say join ', ', farey_sequence(shift || 7);

sub farey_sequence ($n) {
   my @retval;
   my @cache = (0, 1, 1, $n);
   while ($cache[2] < $n) {
      my $k = int(($n + $cache[1]) / $cache[3]);
      push @cache, $k * $cache[2] - $cache[0], $k * $cache[3] - $cache[1];
      push @retval, join '/', splice @cache, 0, 2;
   }
   push @retval, '1/1';
   return @retval;
}
