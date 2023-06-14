#!/usr/bin/env perl
use v5.36;

my $n = shift // 20;

my %l;
$l{0} = 1;
$l{1} = 1;
say "leonardo(0) = $l{0}";
say "leonardo(1) = $l{1}";

foreach my $i (2..$n-1)
{
	$l{$i} = $l{$i-2} + $l{$i-1} + 1;
	say "leonardo($i) = $l{$i}";
}

