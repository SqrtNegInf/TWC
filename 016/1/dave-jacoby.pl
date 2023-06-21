#!/usr/bin/env perl
use v5.36;

my $max_id    = 0;
my $max_slice = 0;
my $pie       = 100;

for my $id ( 1 .. 100 ) {

    # $id is also % of the pie taken, so the last gets all that's left
    # which is microscopic.
    #   id / 100 == slice / pie
    # so
    #   id * pie / 100 = slice
    # and then be sure to remove the slice from the pie.

    my $slice = $pie * $id / 100;
    $pie -= $slice;

    # we want the largest slice, so we start with a zero-slice and
    # go on from there. I know from lookig at the results that as soon
    # as we start seeing the slice size decreasing, we can just stop.
    # but I don't.

    if ( $slice > $max_slice ) {
        $max_slice = $slice;
        $max_id    = $id;
    }
}

say <<"END";
ID:     $max_id
Slice:  $max_slice
END
