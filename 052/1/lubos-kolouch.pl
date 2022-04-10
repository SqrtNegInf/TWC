#!/usr/bin/env perl

use strict;
use warnings;
use feature qw/say/;

sub is_stepping {
    my $number = shift;

    my $seq;

    for my $num (split(//, $number)) {
        unless (defined $seq) {
            $seq = $num;
            next;
        }
        return 0 if abs($num - $seq) != 1;
        $seq = $num;
    }

    return 1;
}

my ($from, $to) = (111,222);

die 'Usage script from to' unless defined $from and defined $to and $from >= 100 and $to <= 999;

for ($from..$to) {
    say $_ if is_stepping($_);
}
use Test::More;

is(is_stepping(100),0,'Test 100');
is(is_stepping(123),1,'Test 123');
is(is_stepping(129),0,'Test 129');
is(is_stepping(321),1,'Test 321');
is(is_stepping(989),1,'Test 989');
done_testing();
