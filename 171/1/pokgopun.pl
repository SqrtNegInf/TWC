#!/usr/bin/env perl
use v5.36;

sub isAbundant{
	### default potential divisor starts with 2 and increases by 1, sum default to 1 as 1 is always a proper divisor
	my($n, $d, $step, $sum) = (shift, 2, 1, 1);
	return 0 unless $n > 1;
	### if the number is odd, a potential divisor starts with 3 and increases by 2 as it has to be odd
	($d, $step) = (3, 2) if $n % 2;
	my $lim = sqrt $n;
	{
		last if $d > $lim;
		unless ($n % $d){
			$sum += $d;
			unless ($n == $d * $d){
				$sum += $n/$d;
			}
			return 1 if $sum > $n;
		}
		$d += $step;
		redo;
	}
	return 0;
}

### check and print if an odd number is abundant, start from 1 and exit when certain numbers of them are found
my($cntdwn, $n, $step) = (20, 1, 2);
{
	printf("%s%s", $n, --$cntdwn ? ", " : "\n") if isAbundant($n);
	last unless $cntdwn;
	$n += $step;
	redo;
}
