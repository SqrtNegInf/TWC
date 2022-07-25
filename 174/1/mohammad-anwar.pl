#!/usr/bin/env perl

use v5.36;
use Test2::V0 -srand => 1;

is disarium_numbers(18),
   [ 0,1,2,3,4,5,6,7,8,9,89,135,175,518,598,1306,1676,2427 ];

done_testing;

#
#
# METHODS

sub is_disarium_number($n) {
    my @n = split //,$n;
    my $s = 0;
    $s += $n[$_] ** ($_ + 1) for (0 .. @n-1);

    return ($s == $n);
}

sub disarium_numbers($n) {
    die "ERROR: Missing number.\n"    unless defined $n;
    die "ERROR: Invalid number $n.\n" if $n < 0;

    my $i  = 0;
    my @dn = ();
    while (@dn < $n) {
        push @dn, $i if is_disarium_number $i;
        $i++;
    }

    return \@dn;
}
