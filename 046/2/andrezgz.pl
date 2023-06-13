#!/usr/bin/env perl
use v5.36;

use constant MAX => 500;

my @rooms = (-1) x MAX; # all rooms are closed
unshift @rooms, 0;      # add room "0" for simplicity

foreach my $e (1 .. MAX) {
    foreach my $r ($e .. MAX) {
        # change the door status if employee checks that door
        $rooms[$r] *= -1 if ($r % $e == 0);
    }
}

print join ',', grep { $rooms[$_] == 1 } (1 .. MAX);;
