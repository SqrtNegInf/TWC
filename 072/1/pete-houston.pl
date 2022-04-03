#!/usr/bin/env perl

use strict;
use warnings;
use Math::GMP;
use Params::Util '_POSINT';
use Lingua::EN::Inflexion;

for my $n ( (10, 12, 20, 125) ) {
	next unless _POSINT ($n);
	my $z =()= Math::GMP->new($n)->bfac =~ /0(?=0*$)/g;
	print inflect ("$n! has <#n:$z> trailing <N:zero>\n");
}
