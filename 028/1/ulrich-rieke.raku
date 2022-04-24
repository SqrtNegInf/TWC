#!/usr/bin/env raku

sub MAIN( Str $filename = $*PROGRAM-NAME) {
  my $fh = open $filename , :r ;
  try $fh.get ;
  if ( $! ) {
      say "The file is binary." ;
  }
  else {
      say "The file is ascii." ;
  }
}
