#!/usr/bin/env raku

my $word = 'Raku';
while ( $word !~~ /^<[a..zA..Z]>+$/ ) {
  say "the word should consist of letters only! Please re-enter!" ;
  $word = $*IN.get ;
}
if ( $word ~~ ( /^<[A..Z]>+$/ | /^<[A..Z]><[a..z]>+$/ | /^<[a..z]>+$/ ) ) {
  say 1 ;
}
else {
  say 0 ;
}
