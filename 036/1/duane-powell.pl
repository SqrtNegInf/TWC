#!/usr/bin/env perl
use v5.36;

use Data::Validate::VIN;

my @vin = qw(JTHBE96S280041733 5YJSA1DP7DFP21717 5XXJSA1DP7DFP217171 5XXJSA1DP7DFP2172);
foreach (@vin) {
	my $v = Data::Validate::VIN->new($_);
 
	if ( $v->valid() ) {
	    say $v->get('vin'), " is valid.";
	}
	else {
	    say "$_" for @{ $v->errors() };
	}
}
