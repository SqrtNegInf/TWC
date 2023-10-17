#!/usr/bin/env perl
use v5.36;

sub main (@ints) {
    my $total    = 0;
    my @solution = ();

    foreach my $i (@ints) {
        $total += $i;
        push @solution, $total;
    }

    say '(', join( ', ', @solution ), ')';
}

main(@ARGV);
