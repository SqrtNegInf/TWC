#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use Algorithm::Combinatorics qw/combinations/;

my $cases = [
    ['Mr. Wall',
     'Mrs. Wall',
     'Mr. Anwar',
     'Mrs. Anwar',
     'Mr. Conway',
     'Mr. Cross',
    ],
    ['Mr. Wall',
     'Mrs. Wall',
     'Mr. Anwar',
    ],
];

sub secret_santa
{
    my $names = shift;

	# generate all possible actions
    my @actions;
    for my $p1 (@$names) {
        my ($t1, $n1) = split(' ', $p1);
        for my $p2 (@$names) {
            next if $p1 eq $p2;
            my ($t2, $n2) = split(' ', $p2);
            next if $n1 eq $n2;
            push @actions, [$p1, $p2];
        }
    }

	# generate all possible actions sets
	my $ret = 0;
    my $iter = combinations(\@actions, scalar @$names);
    while (my $c = $iter->next) {
		my %stat = map { $_ => []} @$names;

		# collect statistics on actions
		for my $action (@$c) {
			my ($n0, $n1) = @$action;
			$stat{$n0}->[0]++;
			$stat{$n1}->[1]++;
		}

		# evaluate statistics
		my $ok = 1;
		for my $k (keys %stat) {
			my ($v1, $v2) = $stat{$k}->@*;
			if (!defined $v1 or $v1 != 1 or !defined $v2 or $v2 != 1) {
				$ok = 0;
				last;
			}
		}
		# print the winner
		if ($ok) {
			for my $action (@$c) {
				my ($n0, $n1) = @$action;
				print "$n0 -> $n1\n";
			}
			$ret = 1;
			last;
		}
    }

    return $ret;
}

is(secret_santa($cases->[0]), 1, 'big set');
is(secret_santa($cases->[1]), 0, 'small set');
done_testing();

exit 0;
