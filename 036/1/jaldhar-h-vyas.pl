#!/usr/bin/env perl
use v5.36;

sub validateVIN {
    my ($vin) = @_;

    if (length $vin != 17) {
        return undef;
    }

    if ($vin !~ /^
        [[:alnum:]]{3} # World Manufacturer Identifier
        [[:alnum:]]{6} # Vehicle Descriptor Section
        [[:alnum:]]{8} # Vehicle Identifier Section
    $/msx) {
        return undef;
    }

    return 1;
}

say (validateVIN(shift // q{JTHBE96S280041733}) ? 'VALID' : 'INVALID');
