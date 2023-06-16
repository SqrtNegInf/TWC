#!/usr/bin/env perl
use v5.36;

    my $vin = 'JTHBE96S280041733';
    if ($vin =~ /[OIQ]/i) {
        say "Invalid VIN";
    } else {
        if ($vin =~ /^[A-Z0-9]{17}$/i) {
            say "VIN is valid";
        } else {
            say "Invalid VIN";
        }
    }
