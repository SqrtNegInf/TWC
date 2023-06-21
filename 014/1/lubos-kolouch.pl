#!/usr/bin/env perl
use v5.36;

my $max = 20;

# cache always the last result
my %pos_cache;
$pos_cache{0} = 0;

# store the final solution
my $solution = 0;

# current position
my $pos = 1;

# cache the last item
my $last = 0;

while ( $pos < $max ) {

    # defaults to 0, if not found in cache yet
    my $result = 0;

    # try to find the previous number in cache
    if ( $pos_cache{$last} ) {
        $result = $pos - $pos_cache{$last};
    }

    # store the result
    $solution .= ",$result";

    # cache the previous result
    $pos_cache{$last} = $pos;

    # update the last number seen
    $last = $result;
    $pos++;
}

say $solution;
