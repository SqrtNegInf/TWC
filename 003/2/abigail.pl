#!/usr/bin/env perl

use v5.36;
#use 5.032;

#use strict;
#use warnings;
#no  warnings 'syntax';

#use experimental 'signatures';
#use experimental 'lexical_subs';

#
# See https://theweeklychallenge.org/blog/perl-weekly-challenge-003
#

#
# Run as: perl ch-2.pl < input-file
#

while (my $rows = <DATA>) {
    chomp $rows;

    #
    # 0-th row
    #
    my @row = (1);
    say "@row";

    foreach (1 .. $rows) {
        #
        # Calculate the next row from the current row
        #
        my @new = map {($_ == 0    ? 0 : $row [$_ - 1]) +
                       ($_ == @row ? 0 : $row [$_])} 0 .. @row;

        #
        # Print
        #
        say "@new";

        #
        # New row becomes current row
        #
        @row = @new;
    }
}

__END__
9
