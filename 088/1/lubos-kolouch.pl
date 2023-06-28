#!/usr/bin/env perl
use v5.36;

use List::Util qw/product/;

sub get_product{
	my $in_arr = shift;

	my $product = product(@$in_arr);

	my @out_arr;

	push @out_arr, int($product / $_) for (@$in_arr);

	return \@out_arr;
}

use Test::More;

is_deeply(get_product([5, 2, 1, 4, 3]), [24, 60, 120, 30, 40]);
is_deeply(get_product([2, 1, 4, 3]), [12, 24, 6, 8]);

done_testing();
