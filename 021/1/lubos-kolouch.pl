#!/usr/bin/env perl

use strict;
use warnings;
use feature qw{ say };
use Carp;
use Math::Big qw{ euler };

my $precision = 100; #shift or croak 'Usage: script precision';

croak 'Usage: script precision - Precision must be an integer > 0' unless $precision =~ /^\d+$/msx;

say "The value of e for precision $precision is " . euler( 1, $precision );

# No test this time, we are just using CPAN module which should be tested

