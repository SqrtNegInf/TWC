#!/usr/bin/env raku

sub MAIN (@n = (1,5,4,3,2,6,7)) { put summations(@n) }

sub summations (@n is copy) {
   for 2 .. @n.end { @n[$_] += @n[$_ - 1] for $_ .. @n.end }
   return @n[*-1];
}
