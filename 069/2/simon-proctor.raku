#!/usr/bin/env raku

#| Calculate S1000 where see https://perlweeklychallenge.org/blog/perl-weekly-challenge-069/
multi sub MAIN ( UInt $S = 7 ) {
    my @ret = [];
    my $count = 0;
    while $S > $count {
        @ret .= push( "0", @ret.reverse.map(*.trans(<0 1> => <1 0>)).Slip );
        #@ret .= push( "0", @ret.hyper.reverse.map(*.trans(<0 1> => <1 0>)).Slip );
        $count++;
    }
    say @ret.join("");
}



