#!/usr/bin/env perl
use v5.36;

for my $i (1..50) {
    say 'Decimal '  . $i .
        ' = Octal ' . to_octal($i);
}

sub to_octal {
    return sprintf('%o', shift);
}
