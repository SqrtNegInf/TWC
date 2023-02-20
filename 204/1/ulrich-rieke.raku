#!/usr/bin/env raku

my @numbers = (1,2,3,4,5,6,7,8,9,10,11,11,11,1,12,13,14,15,15,15,15,16,17,19);
my $len = @numbers.elems ;
my @differences ;
for (0..$len - 2 ) -> $i {
  @differences.push( @numbers[ $i + 1 ] - @numbers[ $i ] ) ;
}
if @differences.grep( { $_ <= 0 } ).elems == $len - 1 ||
@differences.grep( { $_ >= 0 } ).elems == $len - 1 {
  say 1 ;
}
else {
  say 0 ;
}
