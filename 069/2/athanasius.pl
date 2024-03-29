#!/usr/bin/env perl
use v5.36;

################################################################################
=comment

Perl Weekly Challenge 069
=========================

Task #2
-------
*0/1 String*

*Submitted by:* Mohammad S Anwar

A 0/1 string is a string in which every character is either 0 or 1.

Write a script to perform switch and reverse to generate S30 as described
below:

  switch:

  Every 0 becomes 1 and every 1 becomes 0. For example, "101" becomes "010".

  reverse:

  The string is reversed. For example, "001" becomes "100".

[Redacted: To generate S1000 string, please follow the rule as below:]

*UPDATE (2020-07-13 17:00:00):*

It was brought to my notice that generating S1000 string would be nearly
impossible. So I have decided to lower it down to S30. Please follow the rule as
below:

  S0 = ""
  S1 = "0"
  S2 = "001"
  S3 = "0010011"
  ...
  SN = SN-1 + "0" + switch(reverse(SN-1))

=cut
################################################################################

#--------------------------------------#
# Copyright © 2020 PerlMonk Athanasius #
#--------------------------------------#

#*******************************************************************************
=comment

length(SN) = (length(SN-1) * 2) + 1  →  length(SN) = 2^N - 1

So  length(S1000) = 2^1000 - 1 ≅ 1.07 * 10^301 (!)
and length(S30)   = 2^30   - 1 = 1,073,741,823

Note that 1 GiB is 2^30 bytes. So S30 will occupy at least 1 GB of RAM and take
over a billion characters to display! My command prompt terminal is currently
configured to display 45 lines of 80 characters each; so one screen can display
3600 characters. For me to view S30 screen-by-screen I would need to page down
298,262 times!

I have below set $MAX_S to 11, because N = 11 gives the largest value of SN to
fit on a single screen of my terminal. For the record, here it is:

S11 = 00100110001101100010011100110110001001100011011100100111001101100010011000
11011000100111001101110010011000110111001001110011011000100110001101100010011100
11011000100110001101110010011100110111001001100011011000100111001101110010011000
11011100100111001101100010011000110110001001110011011000100110001101110010011100
11011000100110001101100010011100110111001001100011011100100111001101110010011000
11011000100111001101100010011000110111001001110011011100100110001101100010011100
11011100100110001101110010011100110110001001100011011000100111001101100010011000
11011100100111001101100010011000110110001001110011011100100110001101110010011100
11011000100110001101100010011100110110001001100011011100100111001101110010011000
11011000100111001101110010011000110111001001110011011100100110001101100010011100
11011000100110001101110010011100110110001001100011011000100111001101110010011000
11011100100111001101110010011000110110001001110011011000100110001101110010011100
11011100100110001101100010011100110111001001100011011100100111001101100010011000
11011000100111001101100010011000110111001001110011011000100110001101100010011100
11011100100110001101110010011100110110001001100011011000100111001101100010011000
11011100100111001101110010011000110110001001110011011100100110001101110010011100
11011000100110001101100010011100110110001001100011011100100111001101100010011000
11011000100111001101110010011000110111001001110011011100100110001101100010011100
11011000100110001101110010011100110111001001100011011000100111001101110010011000
11011100100111001101110010011000110110001001110011011000100110001101110010011100
11011000100110001101100010011100110111001001100011011100100111001101100010011000
11011000100111001101100010011000110111001001110011011100100110001101100010011100
11011100100110001101110010011100110111001001100011011000100111001101100010011000
11011100100111001101100010011000110110001001110011011100100110001101110010011100
11011100100110001101100010011100110110001001100011011100100111001101110010011000
11011000100111001101110010011000110111001001110011011

=cut
#*******************************************************************************

use strict;
use warnings;
use Const::Fast;

const my $MAX_S => 7;

#-------------------------------------------------------------------------------
BEGIN
#-------------------------------------------------------------------------------
{
    #$| = 1;
    #print "\n";
}

#===============================================================================
MAIN:
#===============================================================================
{
    #print "Challenge 069, Task #2: 0/1 String (Perl)\n\n";

    my $s = '';

    # The call to switch() puts "reverse $s" into list context, which makes re-
    # verse treat $s as a list of 1 element; when reversed, this "list" is, of
    # course, unchanged. Addition of the explicit call to "scalar" forces re-
    # verse to treat $s as a scalar, i.e., as a string, with the desired result
    # that the string's _characters_ are reversed.

    $s .= '0' . switch(scalar reverse $s) for 1 .. $MAX_S;

    print "S$MAX_S = $s\n";
}

#-------------------------------------------------------------------------------
sub switch
#-------------------------------------------------------------------------------
{
    my ($string) = @_;

    return $string =~ tr/01/10/r;
}

################################################################################
