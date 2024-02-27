#!/usr/bin/env perl
use v5.36;

my @ints = (5, 2, 1, 6);
smaller_than_current(\@ints);

@ints = (1, 2, 0, 3);
smaller_than_current(\@ints);

@ints = (0, 1);
smaller_than_current(\@ints);

@ints = (9, 4, 9, 2);
smaller_than_current(\@ints);

exit 0;

sub smaller_than_current {
    my $ints = shift || [];

    my @smaller = map { my $i = $_;
            scalar map { $ints->[$_] < $ints->[$i] ? 1 : ()
        } 0..$#ints
    } 0..$#ints;
    printf "(%s) -> (%s)\n",
        (join ', ', @$ints ),
        (join ', ', @smaller );

    return undef;
}
