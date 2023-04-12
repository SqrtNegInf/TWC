#!/usr/bin/env perl
# WARNING: this polyglot breaks best practices of both Perl 5 and Perl 6 in order to run on both
use v5.36;
print((($_ eq "e") and uc($_) or $_)) for split("", "Perl Weekly Challenge")
