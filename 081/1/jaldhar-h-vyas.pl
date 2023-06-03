#!/usr/bin/env perl
use v5.36;

my $A = 'abcdabcd'; my $B = 'abcdabcdabcdabcd';

my ($smaller, $larger) = length $A < length $B ? ($A, $B) : ($B, $A);
my @base_strings;

for my $c (1 .. length $smaller) {
    if  ((length $larger) % $c == 0) {
        my $l = $larger;
        my $s = substr $smaller, 0, $c;
        $l =~ s/ $s //gmsx;
        if ($l eq q{}) {
            push @base_strings, $s;
        }
    }
}

say q{(}, (join q{ }, sort @base_strings), q{)};
