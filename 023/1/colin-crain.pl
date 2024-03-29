#!/usr/bin/env perl
use v5.36;

my ($depth, @series)  = (1, 5, 9, 2, 8, 1, 6);

if (! $depth) {
    die "usage - first argument order depth of difference\n",
        "further arguments represent the series to be evaluated\n",
        "example: 2 5 9 2 8 1 7  will produce the 2nd order difference on the sequence (5, 9, 2, 8, 1, 7)\n";
}

if (scalar @series - 1 < $depth) {
    die "cannot compute depth $depth difference series:\n",
        "insufficient elements in series \(",
        (join ', ', @series), "\)\n";
}

while ($depth) {

    my @differences = ();

## uncomment to produce a nice verbose representation of intermediate states
#   my $format  = join ', ', map {"%6d"} @series;
#   printf "$format\n", @series;

    ## ratchet through the list creating a new list of differences between
    ## an element and the next forward
    while (scalar @series > 1) {
        my $first = shift @series;
        my $second = $series[0];
        push @differences, ($second - $first);
    }

    $depth--;
    @series = @differences;

}

say  (join ', ', @series);
