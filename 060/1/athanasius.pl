#!/usr/bin/env perl

################################################################################
=comment

Perl Weekly Challenge 060
=========================

Task #1
-------
*Excel Column*

*Reviewed by: Ryan Thompson*

Write a script that accepts a number and returns the *Excel Column Name* it
represents and vice-versa.

Excel columns start at *A* and increase lexicographically using the 26 letters
of the English alphabet, *A*..*Z*. After *Z*, the columns pick up an extra
"digit", going from *AA*, *AB*, etc., which could (in theory) continue to an
arbitrary number of digits. In practice, Excel sheets are limited to 16,384
columns.

*Example*

Input Number: 28 Output: AB

Input Column Name: AD Output: 30

=cut
################################################################################

#--------------------------------------#
# Copyright © 2020 PerlMonk Athanasius #
#--------------------------------------#

use strict;
use warnings;
use Const::Fast;
use Scalar::Util qw( looks_like_number );
use constant WARN_ON_RANGE => 1;

const my $MAX_COLUMN => 16_384;                  # = XFD: 24*26² + 6*26¹ + 4*26⁰

#===============================================================================
    #print "Challenge 060, Task #1: Excel Column (Perl)\n\n";
    my $arg =28;
        my $name = number_to_name($arg);
        print "The Excel column number $arg is named \"$name\"\n";

#-------------------------------------------------------------------------------
sub number_to_name
#-------------------------------------------------------------------------------
{
    my ($num) = @_;
    my  $name = '';
    my  $exp  =  2;
    my  $max  = 26;                                 # Cf. OEIS A218729:
        $max += 26 ** $exp++ while $max < $num;     #     1, 27, 703, 18279, ...

    for my $power (reverse 0 .. $exp - 2)
    {
        my $div   = 26 ** $power;
        my $quo   = int($num / $div);
           $quo   = 26 if $quo > 26;
           $name .= ('A' .. 'Z')[$quo - 1];
           $num  -= $quo * $div;

        last if $num == 0;
    }

    return $name;
}

#-------------------------------------------------------------------------------
sub name_to_number
#-------------------------------------------------------------------------------
{
    my ($name)  = @_;
    my  $number = 0;

    for (my $multiplier = 1; $name; $multiplier *= 26)
    {
        my $char = substr $name, -1, 1, '';
        $number += $multiplier * (ord($char) - ord('A') + 1);
    }

    return $number;
}

################################################################################
