#!/usr/bin/env perl
use v5.36;

use List::Util qw(min);

my $A = 'abcdabcd'; my $B = 'abcdabcdabcdabcd';
my $max_base_len = min(length($A), length($B));

for my $i (1 .. $max_base_len) {
    my $prefix = substr($A, 0, $i);
    if (is_base($prefix, $A) && is_base($prefix, $B)) {
        say $prefix;
    }
}

sub is_base($prefix, $s) {
    my $cnt = length($s) / length($prefix);
    return $prefix x $cnt eq $s;
}

