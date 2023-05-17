#!/usr/bin/env perl
use v5.36;

sub parent {
    my ($fraction) = @_;

    my ($numerator, $denominator) = split m{/}, $fraction;
    unless (defined $numerator && $numerator =~ /^\d+$/ && defined $denominator 
    && $denominator =~ /^\d+$/) {
        return q{};
    }

    if ($numerator < $denominator) {
        return "$numerator/" . abs($denominator - $numerator);
    } elsif ($numerator > $denominator) {
        return abs($denominator - $numerator). "/$denominator";
    } else {
        return q{};
    }
}

my ($member) = '3/5'; #shift // die "Need a string.";

say "parent = '", parent($member), "' and grandparent = '",
    parent(parent($member)), "'";
