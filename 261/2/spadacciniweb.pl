#!/usr/bin/env perl
use v5.36;

my @ints = (5,3,6,1,12);
my $start = 3;
multiply_by_two($start, \@ints);

@ints = (1,2,4,3);
$start = 1;
multiply_by_two($start, \@ints);

@ints = (5,6,7);
$start = 2;
multiply_by_two($start, \@ints);

exit 0;

sub multiply_by_two {
    my $start = shift;
    my $ints = shift;

    my $curr = $start;
    while (grep /^$curr$/, @$ints) {
        $curr *= 2;
    }
    
    printf "start %d (%s) -> %s\n",
        $start,
        (join ',', @$ints),
        $curr;

    return undef;
}
