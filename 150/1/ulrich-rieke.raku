#!/usr/bin/env raku

my ($a, $b) = ('1234', '5678');
while ( $b.chars != $a.chars || $b !~~ /^\d+$/ ) {
  say "second number string should be {$a.chars} characters long!" ;
  say "digits only!" ;
  $b = $*IN.get ;
}
my @fibowords ;
@fibowords.push( $a , $b ) ;
while ( @fibowords[*-1].chars < 51 ) {
  @fibowords.push( @fibowords[*-2] ~ @fibowords[*-1] ) ;
}
say @fibowords[*-1].substr( 50 , 1 ) ;
