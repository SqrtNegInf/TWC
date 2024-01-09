#!/usr/bin/env raku

sub convert( $aString ) {
   if ( $aString ~~ /\D/ ) {
      return $aString.chars ;
   }
   else {
      return $aString.Int ;
   }
}

my @strings = <perl r4ku>;
my @converted ;
@strings.map( { @converted.push( convert( $_ ) ) } ) ;
say @converted.max ;
