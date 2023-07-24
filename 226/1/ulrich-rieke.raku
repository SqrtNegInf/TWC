#!/usr/bin/env raku

my $str = 'lacelengh';
my @numbers = [3,2,0,5,4,8,6,7,1];

my @pairs ;
for ( 0..$str.chars - 1 ) -> $pos {
   @pairs.push( Pair.new( @numbers[ $pos ] , $str.substr( $pos , 1 ) ) ) ;
}
my @letters = @pairs.sort( {$^a.key.Int <=> $^b.key.Int} ).map( {$_.value} ) ;
say join( '' , @letters ) ;
