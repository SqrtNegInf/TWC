#!/usr/bin/env perl
#
=head1 Task 2: Distribute Elements

You are given an array of distinct integers, @ints.

Write a script to distribute the elements as described below:

1) Put the 1st element of the given array to a new array @arr1.
2) Put the 2nd element of the given array to a new array @arr2.

Once you have one element in each arrays, @arr1 and @arr2, then follow the rule
below:

If the last element of the array @arr1 is greater than the last
element of the array @arr2 then add the first element of the
given array to @arr1 otherwise to the array @arr2.

When done distribution, return the concatenated arrays. @arr1 and @arr2.

=head2 Example 1

	Input: @ints = (2, 1, 3, 4, 5)
	Output: (2, 3, 4, 5, 1)

	1st operation:
	Add 1 to @arr1 = (2)

	2nd operation:
	Add 2 to @arr2 = (1)

	3rd operation:
	Now the last element of @arr1 is greater than the last element
	of @arr2, add 3 to @arr1 = (2, 3).

	4th operation:
	Again the last element of @arr1 is greate than the last element
	of @arr2, add 4 to @arr1 = (2, 3, 4)

	5th operation:
	Finally, the last element of @arr1 is again greater than the last
	element of @arr2, add 5 to @arr1 = (2, 3, 4, 5)

	Mow we have two arrays:
	@arr1 = (2, 3, 4, 5)
	@arr2 = (1)

Concatenate the two arrays and return the final array: (2, 3, 4, 5, 1).

=head2 Example 2

	Input: @ints = (3, 2, 4)
	Output: (3, 4, 2)

	1st operation:
	Add 1 to @arr1 = (3)

	2nd operation:
	Add 2 to @arr2 = (2)

	3rd operation:
	Now the last element of @arr1 is greater than the last element
	of @arr2, add 4 to @arr1 = (3, 4).

	Mow we have two arrays:
	@arr1 = (3, 4)
	@arr2 = (2)

Concatenate the two arrays and return the final array: (3, 4, 2).

=head2 Example 3

	Input: @ints = (5, 4, 3 ,8)
	Output: (5, 3, 4, 8)

	1st operation:
	Add 1 to @arr1 = (5)

	2nd operation:
	Add 2 to @arr2 = (4)

	3rd operation:
	Now the last element of @arr1 is greater than the last element
	of @arr2, add 3 to @arr1 = (5, 3).

	4th operation:
	Again the last element of @arr2 is greate than the last element
	of @arr1, add 8 to @arr2 = (4, 8)

	Mow we have two arrays:
	@arr1 = (5, 3)
	@arr2 = (4, 8)

Concatenate the two arrays and return the final array: (5, 3, 4, 8).

=cut

use strict;
use warnings;
use Test2::V0 -no_srand => 1 -srand => 1;
use Data::Dumper;

my $cases = [
	[[2, 1, 3, 4, 5], [2, 3, 4, 5, 1]],
	[[3, 2, 4],       [3, 4, 2]],
	[[5, 4, 3 ,8],    [5, 3, 4, 8]],
];

sub distribute_elements
{
    my $l = shift;

    my (@arr1, @arr2);
    $arr1[0] = shift @$l;
    $arr2[0] = shift @$l;

    for my $e (@$l) {
        if ($arr1[-1] > $arr2[-1]) {
            push @arr1, $e;
        } else {
            push @arr2, $e;
        }
    }

    return [@arr1, @arr2];
}

for (@$cases) {
    is(distribute_elements($_->[0]), $_->[1], $_->[2]);
}
done_testing();

exit 0;

