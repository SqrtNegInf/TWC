#!/usr/bin/env perl

use v5.36;
use Test2::V0 -srand => 1;

is greater_character('b', qw/e m u g/), 'e', 'Example 1';
is greater_character('a', qw/d c e f/), 'c', 'Example 2';
is greater_character('o', qw/j a r/  ), 'r', 'Example 3';
is greater_character('a', qw/d c a f/), 'c', 'Example 4';
is greater_character('v', qw/t g a l/), 'v', 'Example 5';

done_testing;

#
#
# METHOD

sub greater_character($t, @chars) {
    my $ord_t = ord $t;
    for (sort @chars) { return $_ if ord > $ord_t }
    return $t;
}
