#!/usr/bin/env perl
use v5.36;

say h_index((10,8,5,4,3));

sub h_index (@citations) {
   @citations = reverse sort { $a <=> $b } grep { $_ } @citations;
   $_ < $citations[$_] || return $_ for 0 .. $#citations;
   return scalar(@citations);
}
