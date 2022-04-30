#!/usr/bin/env raku

use Test;

multi sub MAIN($guests=100) {
    my $pie=1.0;
    my $biggestSlice=0;
    my $fattestGuest=Nil;
    for 1..$guests -> $g {
        my $slice=$pie*($g/100);
        $pie-=$slice;
        if $slice>$biggestSlice {
            $fattestGuest=$g;
            $biggestSlice=$slice;
        }
        say "guest {$g} gets $slice of the pie";
    }
    say "guest {$fattestGuest} gets the largest slice $biggestSlice";

};

multi sub MAIN("test") {

    done-testing;
}

