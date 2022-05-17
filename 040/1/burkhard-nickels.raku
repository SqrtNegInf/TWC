#!/usr/bin/env raku

use strict;

print "ch-1.p6 (Version 1.0) PWC #40 Task #1: Show multiple arrays content.\n";

my @a1 = ('I','L','O','V','E','Y','O','U');
my @a2 = ('2','4','0','3','2','0','1','9');
my @a3 = ('!','?','£','$','%','^','&','*');

loop ( my $i = 0; $i <= @a1.end; $i++ ) {
	print "@a1[$i] @a2[$i] @a3[$i]\n";
}
