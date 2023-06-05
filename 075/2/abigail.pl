#!/usr/bin/env perl
use v5.36;

while (<DATA>) {
    my @a = split;

    #
    # Get all the different heights. Note that the largest 
    # rectangle will have a height which is equal to the 
    # height of at least one column.
    #
    my %seen;
    my @heights = sort {$a <=> $b} grep {!$seen {$_} ++} @a;

    my $max_area = 0;

    foreach my $h (@heights) {
        #
        # Find the longest amount of sequentical columns with
        # at least that height.
        #
        my $max = 0;
        my $cur = 0;
        foreach my $ch (@a) {
            if ($ch >= $h) {
                $cur ++
            }
            else {
                $max = $cur if $cur > $max;
                $cur = 0;
            }
        }
        $max = $cur if $cur > $max;

        #
        # Calculate the max area for a rectangle with height $h.
        #
        my $area  = $max * $h;

        #
        # Remember the max of all possible heights.
        #
        $max_area = $area if $area > $max_area;
    }
    say $max_area;
}

__END__
2 1 4 5 3 7
3 2 3 5 7 5
