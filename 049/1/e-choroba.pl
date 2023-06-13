#!/usr/bin/env perl
use v5.36;

my $x = 55;
say smallest_multiple($x);

sub smallest_multiple {
    my ($n) = @_;
    my $r = $n;
    $r += $n until $r =~ /^[01]+$/;
    $r
}
