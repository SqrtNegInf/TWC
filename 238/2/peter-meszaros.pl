#!/usr/bin/env perl
use v5.36;

use Test::More;

my $cases = [
	[15, 99, 1, 34],
	[50, 25, 33, 22],
];

sub count_steps
{
	my $n = shift;

	my $steps = 0;
	while(length($n)> 1) {
		++$steps;
		my @n = split('', $n);
		$n = 1;
		$n *= $_ for @n;
	}
	return $steps;
}

sub persistence_sort
{
	my $l = shift;
	
	my @steps = map { count_steps($_) } @$l;

	my @ord = sort { if ($steps[$a] == $steps[$b]) {
					     return $l->[$a] <=> $l->[$b];
					 }
					 return $steps[$a] <=> $steps[$b]
                   } (0 .. $#$l);
	
	return [$l->@[@ord]];
}

is_deeply(persistence_sort($cases->[0]), [1, 15, 34, 99],  '[15, 99, 1, 34]');
is_deeply(persistence_sort($cases->[1]), [22, 33, 50, 25], '[50, 25, 33, 22]');
done_testing();

exit 0;
