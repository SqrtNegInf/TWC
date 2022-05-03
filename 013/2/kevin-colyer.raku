#!/usr/bin/env raku

use Test;

my $f=join ", ", map { F($_) }, (^21);
is $f,"1, 1, 2, 2, 3, 3, 4, 5, 5, 6, 6, 7, 8, 8, 9, 9, 10, 11, 11, 12, 13", "Hofstadter Female sequence";

my $m=join ", ", map { M($_) }, (^21);
is $m,"0, 0, 1, 2, 2, 3, 4, 4, 5, 6, 6, 7, 7, 8, 9, 9, 10, 11, 11, 12, 12", "Hofstadter Male sequence";


multi F($n where $n==0) { 1 }
multi F($n)             { $n - M( F( $n-1 ) ) }

multi M($n where $n==0) { 0 }
multi M($n) { $n − F( M( $n − 1 ) ) }
