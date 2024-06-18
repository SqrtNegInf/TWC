#!/usr/bin/env raku

#say "Enter a word!" ;
my $word = 'aabb';
my $result = False ;
if ( $word ~~ /b/ ) {
   my $pos = $word.index( 'b' ) ;
   if ($word.substr( $pos + 1 ) !~~ /a/) {
      $result = True ;
   }
}
say $result ;
