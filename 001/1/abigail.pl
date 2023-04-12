#!/usr/bin/env perl

use v5.36;

#use 5.032;
#use strict;
#use warnings;
#no  warnings 'syntax';
#use experimental 'signatures';
#use experimental 'lexical_subs';

#
# See https://theweeklychallenge.org/blog/perl-weekly-challenge-001
#

#
# Run as: perl ch-1.pl < input-file
#

while (<DATA>) {
    my $changes = y/e/E/;
    say $_, $changes
}

__END__
Perl Weekly Challenge
