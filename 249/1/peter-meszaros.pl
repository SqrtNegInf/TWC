#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use Data::Dumper;
use Algorithm::Combinatorics qw/partitions/;

my $cases = [
	[3, 2, 3, 2, 2, 2],
	[1, 2, 3, 4],
];

sub equal_pairs
{
    my $l = shift;

    return undef if @$l % 2;
    my @res;
    my $len = @$l / 2;
    my $iter = partitions($l, $len);
    PARTITION: while (my $p = $iter->next) {
        undef @res;
        for (0..$len-1) {
            my @tuple = $p->[$_]->@*;
            next PARTITION unless @tuple == 2 and $tuple[0] == $tuple[1];
            push @res, \@tuple;
        }
        if (@res == $len ) {
            @res = sort {$a->[0] <=> $b->[0]} @res;
            last;
        }
    }

	return \@res;
}

is_deeply(equal_pairs($cases->[0]), [[2, 2], [2, 2], [3, 3]], '[3, 2, 3, 2, 2, 2]');
is_deeply(equal_pairs($cases->[1]), []                      , '[1, 2, 3, 4]');
done_testing();

exit 0;
