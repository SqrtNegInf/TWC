#!/usr/bin/env perl

use strict;
use warnings;

#die "usage: ./ch-1.pl <integers \@N> <integer \$A>\n"
#    unless scalar @ARGV >= 3;

my $A = 7;
my @N = (10, 8, 12, 15, 5);

while (my $int = shift @N) {
    foreach (@N) {
        my $diff = $int - $_;
        print "1\n" and exit 0 if ($diff == $A or $diff == -$A);
    }
}
print "0\n";
