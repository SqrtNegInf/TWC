#!/usr/bin/env raku

my @leonardos = (1 , 1 , 3 , * + * + 1 ...^ *) ;
.say for @leonardos[^20] ;
