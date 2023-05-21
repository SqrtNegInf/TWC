#!/usr/bin/env perl
use v5.36;

#
# What a strange way of phrasing the exercise. We're given a string
# of "delimiter pairs", but we actually have to do nothing at all with
# the "delimiter" part.
#
# Basically, we have two sets of characters which we need to extract
# from the string, but for some reason, the two sets of characters
# are interleaved. Weird.
#

chomp (my $chars = <DATA>);
$_ = <DATA>; # String to search

#
# Extract the characters on the odd and even positions;
# replace / with \/, and \ with \\.
#
my $odds = $chars =~ s/(.)./$1/gr =~ s!([/\\])!\\$1!r;
my $even = $chars =~ s/.(.)/$1/gr =~ s!([/\\])!\\$1!r;

#
# Use y///dc to get rid of the characters which don't match, and
# print the remainder.
# 
say eval "y/$odds//dcr";
say eval "y/$even//dcr";

__END__
[]()
"I like (parens) and the Apple ][+" they said.
