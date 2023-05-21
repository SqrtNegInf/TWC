#!/usr/bin/env perl
use v5.36;

#
# Unlike ch-1.pl, this is a solution which only avoids sqrt (and int for
# that matter)
#
# Given that:
#
#    * sqrt (a)  == a^(1/2)
#    * a^b       == exp (log (a^b)), a > 0
#    * log (a^b) == b * log (a),     a > 0
#
# We can write sqrt (N) as exp (log (N) / 2)
#
# We avoid using int() by just stripping the decimal point and 
# anything following it using a regular expression.
#

say (exp (log ($_) / 2) =~ s/\..*//r) while <DATA>;

__END__
10
9
5
