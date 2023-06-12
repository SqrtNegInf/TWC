#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use Data::Dumper;
use Math::Combinatorics qw/permute/;
use Digest::SHA qw/sha1/;

my $cases = [
	[1, 17, 8],
	[2, 2, 2],
];

sub uniq_perm
{
	my $p = shift;

    my %h;
    my @r;

	for my $e (@$p) {
		my $k = join('|', @$e);
		++$h{$k};
		push @r, $e if $h{$k} == 1;
	}

	return \@r;
}

sub squareful
{
	my $list = shift;

	my @r;
	my @p = permute(@$list);
	my $p = uniq_perm(\@p);

	for my $l (@$p) {
		my $flag = 1;
		for (my $i=1; $i<@$l; ++$i) {
			my $sqrt = sqrt($l->[$i-1] + $l->[$i]);
			if ($sqrt != int($sqrt)) {
				$flag = 0;
				last;
			}
		}
		push @r, $l if $flag;
	}

    return \@r;
}

is_deeply(squareful($cases->[0]), [[1, 8, 17], [17, 8, 1]], '[1, 17, 8]');
is_deeply(squareful($cases->[1]), [[2, 2, 2]],              '[2, 2, 2]');
done_testing();

exit 0;
