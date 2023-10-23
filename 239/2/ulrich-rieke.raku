#!/usr/bin/env raku

sub myCondition( $aString is copy, $allowedSet ) {
   my $letterSet = $aString.comb.Set ;
#the condition is fulfilled if the letterSet is a subset of allowedSet
#or is equal to it
   return $letterSet (<=) $allowedSet ;
}

my $allowed = 'ab';
my $allowedSet = Set.new( $allowed.comb ) ;
my @consistent = <ad bd aaab baa badab>.grep( { myCondition( $_ , $allowedSet ) } ) ;
say @consistent.elems ;
