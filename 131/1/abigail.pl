#!/usr/bin/env perl

use 5.032;

use strict;
use warnings;
#no  warnings 'syntax';

use experimental 'signatures';
use experimental 'lexical_subs';

#
# See ../README.md
#

#
# Run as: perl ch-1.pl < input-file
#

while (<DATA>) {
    my $prev = 0;
    print $prev ? $prev + 1 == $_ ? " " : "\n" : "", $prev = $_ for /[0-9]+/g;
    print "\n";
}

__END__
1, 2, 3, 6, 7, 8, 9
