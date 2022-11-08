#!/usr/bin/env raku

my @characters = qw/d c a f/;
my $target = 'a';
my @sorted = @characters.sort( {$^a leg $^b} ) ;
my $current = 0 ;
while ( not ( @sorted[ $current ] leg $target) == More ) {
  $current++ ;
}
say @sorted[ $current ] ;
