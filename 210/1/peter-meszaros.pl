#!/usr/bin/env perl
use v5.36;

use List::MoreUtils qw(uniq);
use List::Util qw(sum0);
use Test::More;

my $cases = [
	[2, 3, 1],
	[1, 1, 2, 2, 2, 3],
];

sub killnum
{
	my $aref = shift;
    my @uniq = uniq @$aref;

    my $sum = 0;
    for my $n (@uniq) {
		my $r = sum0(grep { $_ >= $n-1 or $_ <= $n+1} @$aref);
        $sum = $r if $r > $sum;
	}
	return $sum;
}

is(killnum($cases->[0]),  6, '[2, 3, 1]');
is(killnum($cases->[1]), 11, '[1, 1, 2, 2, 2, 3]');

done_testing();

exit 0;

