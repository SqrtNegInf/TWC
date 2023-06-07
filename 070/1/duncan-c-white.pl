#!/usr/bin/env perl
use v5.36;

my( $s, $c, $o ) = ('perlandraku', 3, 4);
my $n = length($s);

die "char-swaps: C must be >= 1 ($c given)\n" unless $c>=1;
die "char-swaps: O must be >= 1 ($o given)\n" unless $o>=1;
die "char-swaps: C must be <= O (C:$c, O:$o given)\n" unless $c<=$o;
die "char-swaps: C + O must be <= N (C:$c, O:$o, N:$n given)\n" unless
	$c + $o <= $n;

my $dst = $o+1;
foreach my $i (1..$c)
{
	( substr($s,$i,1), substr($s,$dst,1) ) =
		( substr($s,$dst,1), substr($s,$i,1) );
	$dst++;
	$dst = 0 if $dst == $n;
}

say "result: $s";
