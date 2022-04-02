#!/usr/bin/env raku

my @A = (1, 2, 2, 3, 2, 4, 2);
my $len = @A.elems ;
my %howmany ;
while ( @A ) {
  %howmany{ @A.shift }++ ;
}
my $majority = floor( $len / 2 ) ;
my @sorted = %howmany.keys.sort( { %howmany{ $^b } <=> %howmany{ $^a } } ) ;
if ( %howmany{@sorted[ 0 ]} > $majority ) {
  @sorted[0].say ;
}
else {
  say -1 ;
}
