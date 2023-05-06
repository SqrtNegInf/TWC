#!/usr/bin/env perl
use v5.36;
use Test2::V0 -srand => 1;
use experimental qw(builtin);
use builtin   qw(true false);

ok  esthetic_number(5456), 'Example 1';
ok !esthetic_number(120),  'Example 2';

done_testing;

#
#
# METHOD

sub esthetic_number($n) {
    die "ERROR: Missing number.\n"    unless defined $n;
    die "ERROR: Invalid number $n.\n" if $n < 0;

    my @n = split //, $n;
    foreach my $i (1 .. @n-1) {
        return false if abs($n[$i-1] - $n[$i]) != 1;
    }
    return true;
}
