#!/usr/bin/env perl

use v5.22;

my @to_table = ( 0 .. 9, 'A' .. 'Y');
my %from_table;
while (my ($index, $element) = each @to_table) {
    $from_table{$element} = $index;
}

sub convert_to {
    my $x = shift;  my $pow = 1; my @ret;
    do {
        my $digit = $x % 35;
        unshift @ret, $to_table[$digit];
        $x -= $digit;
        $x /= 35;
    } while $x > 0;
    return join '', @ret
}

sub convert_from {
    my $x; my $pow =1;
    for (reverse split //, shift) {
        $x += $from_table{$_} * $pow;
        $pow *= 35;
    }
    return $x
}

say convert_from('RAKU');
