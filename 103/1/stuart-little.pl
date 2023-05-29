#!/usr/bin/env perl
use v5.36;

sub animal($animals,$year,$base) {
    @{$animals}[($year - $base) % (scalar @{$animals})]
}

sub elt($elts,$year,$base) {
    @{$elts}[int((($year - $base) % (2*(scalar @{$elts})))/2)]
}

my @animals=qw(Rat Ox Tiger Rabbit Dragon Snake Horse Goat Monkey Rooster Dog Pig);
my @elts=qw(Wood Fire Earth Metal Water);
my $year=2022;

say qq|${\ do {elt(\@elts,$year,1924)}} ${\ do {animal(\@animals,$year,1924)}}|;

