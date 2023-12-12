#!/usr/bin/env perl
use v5.36;

use Test::More;
use Data::Dumper;

my $cases = [
    [1, 1, 2, 3, 5],
    [4, 2, 4, 5, 7],
    [4, 1, 2, -3, 8],
];

# a[2] = p * a[0] + q * a[1]
# a[3] = p * a[1] + q * a[2]
# a[4] = p * a[2] + q * a[3]
# --------------------------
# p = (a[2] - q * a[1]) / a[0]
# q = (a[3] * a[0] - a[2] * a[1]) / (a[2] * a[0] - a[1] * a[1])
# r = p * a[2] + q + a[3]
# if p is int and q is int and r == a[4] then true else false
sub linreq_of_second_order
{
    my $l = shift;

    my $q = ($l->[3]*$l->[0] - $l->[2]*$l->[1]) /
        ($l->[2]*$l->[0] - $l->[1]*$l->[1]);
    my $p = ($l->[2] - $q*$l->[1]) / $l->[0];

    my $r = $p*$l->[2] + $q*$l->[3];

    return ($p == int($p) && $q == int($q) && $l->[4] == $r) ? 1 : 0;
}

is(linreq_of_second_order($cases->[0]),  1, '[1, 1, 2, 3, 5]');
is(linreq_of_second_order($cases->[1]),  0, '[4, 2, 4, 5, 7]');
is(linreq_of_second_order($cases->[2]),  1, '[4, 1, 2, -3, 8]');
done_testing();

exit 0;
