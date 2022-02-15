#!/usr/bin/env raku

#say "Enter integers i , j and k, separated by blanks!" ;
my $line = '1000 999 314159'; #$*IN.get ;
while ( $line !~~ /^\s* (\d+ \s*) ** 3  $/ ) {
  say "Enter integers i , j and k , separated by blanks!" ;
  $line = $*IN.get ;
}
my ( $i , $j , $k ) = $line.split( /\s+/ ) ;
my @allNumbers ;
for ( 1 .. $j ) -> $num {
  @allNumbers.push( $num ) ;
}
for ( 2 .. $i ) -> $mult {
  for ( 1 .. $j ) -> $num {
      @allNumbers.push( $mult * $num ) ;
  }
}
my @sorted = @allNumbers.sort ;
say @sorted[ $k - 1 ] ;
