#!/usr/bin/env perl

use strict;
use warnings;

$_ = lc "The quick brown fox jumps over the lazy dog";
s/\s//g;

for my $i ( 0..7 ) {

    last if ( pos = $i ) == length;

    print
        $i ? ' ' : '',
        /(.).{0,7}/g;
}
