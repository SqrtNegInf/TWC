#!/usr/bin/env perl
use v5.36;

use Test::More;

my $cases = [
    [1,1,2,2,2,3],
    [2,3,1,3,2],
    [-1,1,-6,4,5,-6,1,4,1],
];

sub frequency_sort
{
    my $l = shift;
 
    my %h;

	++$h{$_} for @$l;

	my @keylist = sort { if ($h{$a} == $h{$b}) {
							return $b <=> $a;
                         } else {
	                        return $h{$a} <=> $h{$b};
						 }
					   } keys %h;

    my @ret;
	for my $v (@keylist) {
		push @ret, ($v) x $h{$v};
	}

    return \@ret;
}

is_deeply(frequency_sort($cases->[0]), [3,1,1,2,2,2],          '[1,1,2,2,2,3]');
is_deeply(frequency_sort($cases->[1]), [1,3,3,2,2],            '[2,3,1,3,2]');
is_deeply(frequency_sort($cases->[2]), [5,-1,4,4,-6,-6,1,1,1], '[-1,1,-6,4,5,-6,1,4,1]');
done_testing();

exit 0;
