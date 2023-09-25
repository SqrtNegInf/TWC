#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;

my $cases = [
    [1, 0, 2, 3, 0, 4, 5, 0],
    [1, 2, 3],
    [0, 3, 0, 4, 5],
];

sub duplicate_zeros
{
	my $l = shift;
    
    my $len = @$l - 1;
    my @res = map { $_ == 0 ? qw/0 0/ : $_} @$l;
	@res = @res[0 .. $len];
	return \@res;
}

is_deeply(duplicate_zeros($cases->[0]), [1, 0, 0, 2, 3, 0, 0, 4], '[1, 0, 2, 3, 0, 4, 5, 0]');
is_deeply(duplicate_zeros($cases->[1]), [1, 2, 3],                '[1, 2, 3]');
is_deeply(duplicate_zeros($cases->[2]), [0, 0, 3, 0, 0],          '[0, 3, 0, 4, 5]');
done_testing();

exit 0;
