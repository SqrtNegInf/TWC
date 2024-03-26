#!/usr/bin/env raku

my @numbers = (1, 2, 3, 45);
my $element_sum = [+] @numbers ;
my $digit_sum = [+] @numbers.map( {[+] $_.Str.comb.map( {.Int} )} ) ;
say abs( $element_sum - $digit_sum ) ;
