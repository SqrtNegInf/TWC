#!/usr/bin/env perl
use v5.36;

use List::Util qw/ sum /;

my @ints = (2, 5, 9, 11, 3); my $k = 1;
sum_of_values(\@ints, $k);

@ints = (2, 5, 9, 11, 3); $k = 2;
sum_of_values(\@ints, $k);

@ints = (2, 5, 9, 11, 3); $k = 0;
sum_of_values(\@ints, $k);

exit 0;

sub sum_of_values {
    my $ints = shift || [];
    my $k = shift || 0;

    my @indexes = map { ( (scalar grep { /1/ }
                                 split //, sprintf ("%b", $_) ) == $k )
                            ? $_
                            : ()
                  } 0..(scalar @$ints)-1;
    printf "(%s) %d -> %s\n",
        (join ', ', @$ints ), $k,
        sum @ints[@indexes];

    return undef;
}
