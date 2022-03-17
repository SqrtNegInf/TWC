#!/usr/bin/env perl

use 5.032;

use strict;
use warnings;
no  warnings 'syntax';

use experimental 'signatures';
use experimental 'lexical_subs';

#
# See ../README.md
#

#
# Run as: perl ch-1.pl < input-file
#

#
# Read a string and a pattern. Turn the pattern into a regular expression:
#    - '?'  becames '.'
#    - '*'  becomes '.*'
#    - any other character will be quotemetaed.
#
# Then map the string against the pattern, anchored and with /s.
#
while (<DATA>) {
    my ($str, $pat) = split ' ', $_;
    $pat =~ s {(.)} {$1 eq "?" ? "." 
                   : $1 eq "*" ? ".*"
                   : quotemeta $1}esg;
    say $str =~ /^$pat$/s ? 1 : 0
}

__END__
abcde a*e
abcde a*d
acde a*c?e
