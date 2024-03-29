#!/usr/bin/env perl
use v5.36;

my $iterations = 20;

# Computed sequence
my @vaneck = (0);

# Map numbers to the last time they appear in sequence
my %lastpos = (0 => 0);

# For every n, compute (push) n+1
foreach my $n (0 .. $iterations-2) {
    my $curn = $vaneck[$n];
    my $m = $lastpos{$curn};
    my $nextn = defined $m ? $n-$m : 0;
    push @vaneck, $nextn;
    $lastpos{$curn} = $n;
}

print "@vaneck\n";
