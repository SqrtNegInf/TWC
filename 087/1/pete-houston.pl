#!/usr/bin/env perl
use v5.36;

my @n      = sort { $a <=> $b } my @N = (100, 4, 50, 3, 2);
my @maxseq = 0;

for my $i (0 .. $#n - 1) {
	my $j = $i + 1;
	my @seq = $n[$i];
	while ($n[$j] == $n[$i] + $j - $i) {
		push @seq, $n[$j++];
		last if $j > $#n;
	} continue {
		@maxseq = @seq if $#seq > $#maxseq;
	}
}

print "@maxseq\n";
