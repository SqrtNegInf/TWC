#!/usr/bin/env perl
use v5.36;

use strict;
use warnings;

my @L = sort { $a <=> $b } (19,11,9,7,20,3,17,16,2,14,1);
my $N = find_noble_number(@L);

(defined $N)
?
(print "Found Noble number $N.\n")
:
(print "None Noble number found.\n");

#
#
# METHOD

sub find_noble_number {
    my (@L) = @_;

    foreach my $N (@L) {
        return $N if (scalar( grep { $_ > $N } @L ) == $N);
    }

    return;
}
