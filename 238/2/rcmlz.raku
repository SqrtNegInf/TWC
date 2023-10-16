#!/usr/bin/env raku

our sub solution(@input) is export {
    sort &persistence-order, @input 
}

sub split-and-multiply(UInt $x --> UInt){
    return 0 if $x < 10;
    my $r = [*] $x.Str.comb.map: *.UInt;
    1 + samewith($r)
}

sub persistence-order(UInt $a, UInt $b --> Order){
    my ($x, $y) of UInt = ($a, $b).map: *.&split-and-multiply;
    my Order $ord = $x cmp $y;
    $ord eqv Same ?? $a cmp $b !! $ord
}

say solution ( (15, 99, 1, 34) );
