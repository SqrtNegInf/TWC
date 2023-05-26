#!/usr/bin/env perl
use v5.36;
#===============================================================================
#
#         FILE: 11502.pl
#
#        USAGE: ./11502.pl N [ N ... ]
#
#  DESCRIPTION: Output largest multiple of 2 formed from the given digits
#
# REQUIREMENTS: Perl 5.10 (for 'say')
#        NOTES: Each N must be a decimal digit
#       AUTHOR: Pete Houston (pete), cpan@openstrike.co.uk
# ORGANIZATION: Openstrike
#      VERSION: 1.0
#      CREATED: 02/06/21
#===============================================================================

use strict;
use warnings;
use feature 'say';

# Sort ascending
my @n = sort (4, 1, 7, 6);

# Find the lowest even digit
my ($i) = grep { 0 == $n[$_] % 2 } 0 .. $#n;

# If no even digits the task is impossible
die "No multiple of 2 possible with (@ARGV)\n" unless defined $i;

# Print digits descending but with lowest even digit at the end
unshift @n, splice (@n, $i, 1) if $i;
say reverse @n;
