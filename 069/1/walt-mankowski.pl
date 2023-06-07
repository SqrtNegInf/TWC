#!/usr/bin/env perl
use v5.36;

my @flip = qw(0 1 x x x x 9 x 8 6);

my ($A, $B) = (1,200);
for my $n ($A..$B) {
    say $n if is_strobogrammatic($n);
}

sub is_strobogrammatic($n) {
    my $flipped = $n;
    $flipped =~ tr/0123456789/01xxxx9x86/;
    return $n eq scalar reverse $flipped;
}
