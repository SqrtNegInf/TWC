#!/usr/bin/env raku

my @numbers = (8, 1, 2, 2, 3);
my $len = @numbers.elems ;
my @solution ;
for (0..$len - 1 ) -> $index {
   my @selected = @numbers.grep( { $_ < @numbers[ $index ] } ) ;
   @solution.push( @selected.elems ) ;
}
say "(" ~ @solution.join( ',' ) ~ ")" ;
