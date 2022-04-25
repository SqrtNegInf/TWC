#!/usr/bin/env raku

#sub MAIN(Str $stones, Str $jewels) {
my $a = 'chancellor'; my $b = 'chocolate';

    sub collect(Str $s) { $s.comb(/<[A..Z a..z]>/).Bag }

    say [+] collect($a){collect($b).keys};
