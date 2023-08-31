#!/usr/bin/env raku

#say "Enter some integers, separated by blanks!" ;
#my $line = $*IN.get( ) ;
my @numbers = (3, 2, 1, 4);
my $mini = @numbers.min ;
my $maxi = @numbers.max ;
my @selected = @numbers.grep( { $_ != $mini && $_ != $maxi } ) ;
if ( @selected.elems == 0 ) {
   say -1 ;
}
else {
   say "(" ~ @selected.join( ',' ) ~ ")" ;
}
