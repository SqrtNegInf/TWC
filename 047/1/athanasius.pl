#!/usr/bin/env perl

################################################################################
=comment

Perl Weekly Challenge 047
=========================

Task #1
-------
*Roman Calculator*

Write a script that accepts two roman numbers and operation. It should then
perform the operation on the given roman numbers and print the result.

For example,

  perl ch-1.pl V + VI

It should print

  XI

=cut
################################################################################

#--------------------------------------#
# Copyright © 2020 PerlMonk Athanasius #
#--------------------------------------#

use strict;
use warnings;
use Const::Fast;
use List::Util  qw( any );
use Math::Roman qw( roman );

const my @OPERATIONS   => qw( + - * / % );      # '/' denotes *integer* division
const my @ROMAN_DIGITS => qw( I V X L C D M );

#===============================================================================
MAIN:
#===============================================================================
{
    my @ARGV = <V + VI>;
    my $lhs  = validate_roman(uc $ARGV[0]);
    my $op   = $ARGV[1];

    any { $op eq $_ } @OPERATIONS or die "ERROR: Unknown operator '$op'\n";

    my $rhs  = validate_roman(uc $ARGV[2]);
    my $rslt = roman(int eval "$lhs $op $rhs");

    printf "%s %s %s = %s\n", uc $ARGV[0], $op, uc $ARGV[2], $rslt;
}

#-------------------------------------------------------------------------------
sub validate_roman
#-------------------------------------------------------------------------------
{
    my ($roman) = @_;

    for my $digit (split //, $roman)
    {
        any { $digit eq $_ } @ROMAN_DIGITS
            or die "ERROR: Unknown Roman digit '$digit'\n";
    }

    my $math_roman = roman($roman);
       $math_roman->is_nan() and die 'ERROR: ', Math::Roman::error(), "\n";

    return $math_roman->as_number();
}

################################################################################
