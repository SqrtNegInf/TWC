#!/usr/bin/env perl
use v5.36;

sub pandigital_numbers {
    my ($count) = @_;
    my @pandigitals = (1023456789);
    while (--$count) {
        my $next = 1 + $pandigitals[-1];
        ++$next until 10 == grep -1 != index($next, $_), 0 .. 9;
        push @pandigitals, $next;
    }
    say for @pandigitals;
}

pandigital_numbers(10);
