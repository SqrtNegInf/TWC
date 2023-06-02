#!/usr/bin/env perl
use v5.36;

###############################################################################
=comment

Perl Weekly Challenge 083
=========================

Task #1
-------
*Words Length*

Submitted by: Mohammad S Anwar

You are given a string $S with 3 or more words.

Write a script to find the length of the string except the first and last words
ignoring whitespace.

Example 1:

 Input: $S = "The Weekly Challenge"

 Output: 6

Example 2:

 Input: $S = "The purpose of our lives is to be happy"

 Output: 23

=cut
###############################################################################

#--------------------------------------#
# Copyright © 2020 PerlMonk Athanasius #
#--------------------------------------#

use strict;
use warnings;
use Const::Fast;        # Exports const()

const my $USAGE =>
"Usage:
  perl $0 <S>

    <S>    A single string containing 3 or more words separated by whitespace";

#------------------------------------------------------------------------------
BEGIN
#------------------------------------------------------------------------------
{
    #$| = 1;
    #print "\nChallenge 083, Task #1: Words Length (Perl)\n\n";
}

#==============================================================================
MAIN:
#==============================================================================
{
    my $S     = 'Markmið lífs okkar er að vera hamingjusöm';
    my @words = split /\s+/, $S;

    scalar @words >= 3           or error('Too few words in the input string');

    print qq[Input: \$S = "$S"\n\n];

    my $length  = 0;
       $length += length for @words[1 .. $#words - 1];

    print "Output: $length\n";
}

#------------------------------------------------------------------------------
sub error
#------------------------------------------------------------------------------
{
    my ($message) = @_;

    die "ERROR: $message\n$USAGE\n";
}

###############################################################################
