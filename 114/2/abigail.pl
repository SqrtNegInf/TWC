#!/usr/bin/env perl
use v5.36;

#
# For a description of the algorithm, see
# https://abigail.github.io/HTML/Perl-Weekly-Challenge/week-114-2.html
#

say oct sprintf ("0b0%b" => $_) =~ s {01(1*)(0*)$} {10$2$1}r for <3 12>;
