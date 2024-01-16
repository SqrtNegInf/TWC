#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use List::Util qw/min/;

my $cases = [
	[[ 3,  7,  8],
	 [ 9, 11, 13],
	 [15, 16, 17]],
	[[ 1, 10,  4,  2],
	 [ 9,  3,  8,  7],
	 [15, 16, 17, 12]],
	[[7 ,8],
	 [1 ,2]],
];

sub lucky_numbers
{
	my $l = shift;

    my (@rowmin, @colmax);
	for my $row (@$l) {
        push @rowmin, min $row->@*;
        for my $i (0..$#$row) {
            $colmax[$i]  = $row->[$i] if ($colmax[$i] // 0) < $row->[$i];
        }
	}

	my $lucky = -1;
    my %hash = map {$_ => 1} @rowmin;
    for my $v (@colmax) {
        if (exists $hash{$v}) {
            $lucky = $v;
            last;
        }
        $hash{$v}++;
    }

	return $lucky;
}

is(lucky_numbers($cases->[0]), 15, 'Example 1');
is(lucky_numbers($cases->[1]), 12, 'Example 2');
is(lucky_numbers($cases->[2]),  7, 'Example 3');
done_testing();

exit 0;

         
