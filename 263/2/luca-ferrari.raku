#!/usr/bin/env raku

sub MAIN() {
    my $items1 = [ [1,1], [2,1], [3,2] ];
    my $items2 = [ [2,2], [1,3] ];

    my %quantities;
    %quantities{ $_[ 0 ] } += $_[ 1 ] for $items1.flat;
    %quantities{ $_[ 0 ] } += $_[ 1 ] for $items2.flat;

    #%quantities.Array.say;
    %quantities{$_}.say for %quantities.keys.sort;
}
