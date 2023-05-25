#!/usr/bin/env perl
use v5.36;

#
# More efficient is to store the binary representation of the number
# in a variable, and see whether it's the same as its reverse, but
# using a pattern turns it into a one liner.
#

say sprintf ("%b" => $_) =~ /^([01]?|([01])(?1)\g{2})$/ || 0 while <DATA>;

__END__
4
5
98
99
