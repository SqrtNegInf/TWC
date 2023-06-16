#!/usr/bin/env perl
use v5.36;

use Data::Validate::VIN;

my $vin = 'JTHBE96S280041733';

my $vv = Data::Validate::VIN->new($vin);

if ( $vv->valid() ) {
    say 'valid';
}
else {
    say "ERROR: $_" for @{ $vv->errors() };
}


