#!/usr/bin/env raku

sub MAIN( @n = (1,3,5,6,9)) {
    my $am = @n.sum / @n.elems;
    my $gm = ( [*] @n ) ** ( 1 / @n.elems.Rat );
    my $hm = @n.elems / @n.map( 1/* ).sum;

    "AM = $am GM = $gm HM = $hm".say;
}
