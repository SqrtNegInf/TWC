#!/usr/bin/env perl
use v5.36;

use List::Util 1.45 qw(uniq);

foreach my $i (234 .. 987) {
    my @N = split //, $i;
    # Only try if all three digits are unique.
    next if ( scalar(uniq(@N)) != scalar(@N) );

    my @S = ($N[0], $N[1], $N[2], ($N[0] * $N[1]), ($N[1] * $N[2]), ($N[0] * $N[1] * $N[2]));

    print "[$i] => [", join(", ", @S), "]\n"
        if ( scalar(uniq(@S)) == scalar(@S) );
}
