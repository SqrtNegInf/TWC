#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

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
