#!/usr/bin/env perl
use v5.36;

use Memoize;
memoize("edit_distance");

sub edit_distance{
    my($s, $t) = @_;
    if(length($s) == 0){
        return length($t);
    }
    if(length($t) == 0){
        return length($s);
    }
    my($s0, $t0) = (substr($s, 0, 1), substr($t, 0, 1));
    if($s0 eq $t0){
        return edit_distance(substr($s, 1), substr($t, 1));
    }
    my @sorted_distances = sort {$a <=> $b} (
        edit_distance($s, substr($t, 1)),
        edit_distance(substr($s, 1), $t),
        edit_distance(substr($s, 1), substr($t, 1)),
    );
    return 1 + $sorted_distances[0];
}

MAIN:{
    my $distance;
    
    $distance = edit_distance("kitten", "sitting");
    print "$distance\n";

    $distance = edit_distance("sunday", "monday");
    print "$distance\n";
}
