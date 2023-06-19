#!/usr/bin/env perl
use v5.36;

################################################################################
=comment

Perl Weekly Challenge 023
=========================

Task #2
-------
Create a script that prints *Prime Decomposition* of a given number. The prime
decomposition of a number is defined as a list of prime numbers which when all
multiplied together, are equal to that number. For example, the Prime decomposi-
tion of 228 is 2,2,3,19 as 228 = 2 * 2 * 3 * 19.

=cut
################################################################################

#--------------------------------------#
# Copyright © 2019 PerlMonk Athanasius #
#--------------------------------------#

use strict;
use warnings;
use Const::Fast;
use Math::Prime::Util qw( factor );

const my $USAGE => "USAGE: perl $0 <UInt gt 1>\n";

#===============================================================================
MAIN:
#===============================================================================
{
    my $number = 11111;

    $number > 1
        or die "Invalid number ($number): must be an integer > 1\n$USAGE";

    printf "The prime decomposition of %d is: %s\n", $number,
        join ', ', factor($number);
}

################################################################################
