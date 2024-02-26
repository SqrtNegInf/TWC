#!/usr/bin/env raku

#say "Enter some integers, separated by blanks!" ;
#my $line = $*IN.get ;
my @numbers = (5, 2, 1, 6);
my @result ;
for @numbers -> $num {
   @result.push( @numbers.grep( { $_ < $num } ).elems ) ;
}
say "(" ~ @result.join( ',' ) ~ ")" ;
