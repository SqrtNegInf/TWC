#!/usr/bin/env perl
use v5.36;

my @grid;
my $len;

while ($_ = <DATA>) {
	my @row = /([*x])/g;
	if (defined $len) {
		die "Non-rectangular grid" unless $#row == $len;
	} else {
		$len = $#row;
	}
	push @grid, \@row;
}

for my $r (0..$#grid) {
	for my $c (0..$len) {
		next if $grid[$r][$c] eq 'x'; # Bombs are bombs

		# Count the neighbours
		my $sum = 0;
		for my $y ($r - 1 .. $r + 1) {
			for my $x ($c - 1 .. $c + 1) {
				$sum++ if
					$y >= 0 && $y <= $#grid &&
					$x >= 0 && $x <= $len &&
					($y != $r || $x != $c) &&
					$grid[$y][$x] eq 'x';
			}
		}
		$grid[$r][$c] = $sum;
	}
	print "@{$grid[$r]}\n";
}

__END__
x * * * x * x x x x
* * * * * * * * * x
* * * * x * x * x *
* * * x x * * * * *
x * * * x * * * * x
