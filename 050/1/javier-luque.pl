#!/usr/bin/env perl
use v5.36;

use List::Util qw /min max /;

my $arg_string = join '', "[2,7], [3,9], [10,12], [15,19], [18,22]";
$arg_string =~ s/[\s\[\]]//g;
my @values = split (',', $arg_string);
my @lists;

# Create the lists
while (@values) {
    my $min = shift @values;
    my $max = shift @values;
    push @lists, [$min, $max];
}

my $i = 0;
while ($i < scalar(@lists) - 1) {
    if ( $lists[$i]->[1] >= $lists[$i+1]->[0] &&
         $lists[$i]->[0] <= $lists[$i+1]->[1]) {
        my $new_min = min($lists[$i]->[0], $lists[$i+1]->[0]);
        my $new_max = max($lists[$i]->[1], $lists[$i+1]->[1]);
        splice ( @lists, $i, 2, [$new_min, $new_max] );
    } else {
        $i++;
    }
}

say join ', ',
    map { '[' . $_->[0] . ', ' . $_->[1] . ']'}
    @lists;
