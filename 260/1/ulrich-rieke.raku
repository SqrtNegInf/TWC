#!/usr/bin/env raku

my @numbers = (1,2,2,1,1,3);
my %uniques ;
my %frequencies ;
for @numbers -> $num {
   %uniques{ $num }++ ;
}
for %uniques.keys -> $num {
   %frequencies{ @numbers.grep( {$_ == $num} ).elems }++ ;
}
if ( %uniques.keys.elems == %frequencies.keys.elems) {
   say 1 ;
}
else {
   say 0 ;
}
