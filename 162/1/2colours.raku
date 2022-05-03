#!/usr/bin/env raku

my @digits = 978905691538.comb; #prompt('ISBN 13 number without the last digit: ').comb: /\d/;
say "The last digit is: {[+] (1,3) <<*<< @digits andthen -$_ % 10}.";
