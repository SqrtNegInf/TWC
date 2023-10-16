#!/usr/bin/env raku

my @numbers = (1, 2, 3, 4, 5);
my $len = @numbers.elems ;
my @result ;
my $current_sum = 0 ;
for (0..$len - 1 ) -> $pos {
   $current_sum += @numbers[ $pos ] ;
   @result.push( $current_sum ) ;
}
say "(" ~ @result.join( ',' ) ~ ")" ;
