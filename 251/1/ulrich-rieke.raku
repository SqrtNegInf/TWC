#!/usr/bin/env raku

my @numbers = (10, 7, 31, 5, 2, 2);
my $sum = 0 ;
while ( @numbers.elems > 0 ) {
   if ( @numbers.elems > 1 ) {
      my $concatenated = (@numbers[0] ~ @numbers[*-1]).Int ;
      $sum += $concatenated ;
      @numbers.shift ;
      @numbers.pop ;
   }
   else {
      my $first = @numbers.pop.Int ;
      $sum += $first ;
   }
}
say $sum ;
