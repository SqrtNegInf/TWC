#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;
use Data::Dumper;

my $cases = [
	[
		[1, 1, 0],
		[0, 1, 0],
		[0, 0, 0],
	],
	[
		[0, 1,-2, 0, 1],
		[0, 0, 0, 1, 3],
		[0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0],
	],
	[
		[1, 0, 0, 4],
		[0, 1, 0, 7],
		[0, 0, 1,-1],
	],
	[
		[0, 1,-2, 0, 1],
		[0, 0, 0, 0, 0],
		[0, 0, 0, 1, 3],
		[0, 0, 0, 0, 0],
	],
	[
		[0, 1, 0],
		[1, 0, 0],
		[0, 0, 0],
	],
	[
		[4, 0, 0, 0],
		[0, 1, 0, 7],
		[0, 0, 1,-1],
	],
];

sub printm
{
    my $m = shift;

    print "[ ", join(', ', @$_), " ]\n" for @$m;
}

sub reduced_row_echelon
{
	my $m = shift;

    #printm($m);
    my $prev_pos = -1;
	my $has_allzero_row = 0;
    for my $row (@$m) {
        # 1. If a row does not consist entirely of zeros, then the first
        #    nonzero number in the row is a 1. We call this the leading 1.
        my ($one_pos) = grep { $row->[$_] } 0..$#$row; # undef if all zeros
        return 0 if defined $one_pos && $row->[$one_pos] != 1;
        
        # 2. If there are any rows that consist entirely of zeros, then
        #    they are grouped together at the bottom of the matrix.
        if (!defined $one_pos) {
            return 0 if defined $prev_pos && $has_allzero_row;
			$has_allzero_row = 1;
            $prev_pos = $one_pos;
            next;
		}

        # 3. In any two successive rows that do not consist entirely of zeros,
        #    the leading 1 in the lower row occurs farther to the right than
        #    the leading 1 in the higher row.
        return 0 if defined $prev_pos && $one_pos <= $prev_pos;
        $prev_pos = $one_pos;

        # 4. Each column that contains a leading 1 has zeros everywhere else
        #    in that column.
        my @col = grep {$m->[$_]->[$one_pos]} 0..$#$m;
        return 0 unless @col == 1 && $m->[$col[0]]->[$one_pos] == 1;
    }
    return 1;
}

is(reduced_row_echelon($cases->[0]), 0, 'Example 1');
is(reduced_row_echelon($cases->[1]), 1, 'Example 2');
is(reduced_row_echelon($cases->[2]), 1, 'Example 3');
is(reduced_row_echelon($cases->[3]), 0, 'Example 4');
is(reduced_row_echelon($cases->[4]), 0, 'Example 5');
is(reduced_row_echelon($cases->[5]), 0, 'Example 6');
done_testing();

exit 0;

