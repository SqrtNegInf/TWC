#!/usr/bin/env raku

my $line = (2, 5, 4, 4, 5, 5, 2);
while ( $line !~~ /(\d?)+ % ' '/ ) {
  say "Enter only integers divided by spaces!" ;
  $line = $*IN.get ;
}
my @array = $line.split( /\s/ ) ;
my %numcount ;
@array.map( {%numcount{ $_ }++} ) ;
say %numcount.keys.grep( { not %numcount{$_} %% 2 } )[0] ;
