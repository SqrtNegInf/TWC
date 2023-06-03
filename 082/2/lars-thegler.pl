#!/usr/bin/env perl
use v5.36;

my ($A, $B, $C) = ('XXY', 'XXZ', 'XXXXZY');


my %interleaves;
$interleaves{$_}++ for interleave($A, $B), interleave($B, $A);

say exists $interleaves{$C} ? 1 : 0;

sub interleave {
    my ($a, $b) = @_;
    my @interleaves;
    for my $i (0..length $a) {
       my $s = $a;
       $s =~ s/^(.{$i})(.*)/$1$b$2/;
       push @interleaves, $s;
    }
    return @interleaves;
}
