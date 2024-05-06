#!/usr/bin/env raku

my @numbers = (-1, -2, -3, -4,  3,  2,  1);
my $prod = [*] @numbers ;
my $result ;
if ( $prod > 0 ) {
   $result = 1 ;
}
elsif ( $prod == 0 ) {
   $result = 0 ;
}
else {
   $result = -1 ;
}
say $result ;
