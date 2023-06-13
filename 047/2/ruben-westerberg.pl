#!/usr/bin/env perl
use v5.36;

my @gapful;
while (@gapful < 20) {
	state $i=99;
	push @gapful, $i unless ++$i % int join "", do {my @a=split("",$i);@a[0,-1]};
}
print join " ",@gapful;
