#!/usr/bin/env raku
use v6 ;

sub MAIN( Str $input is copy = '17:50') {
  if ( $input.substr( *-2 , 1) ~~ /(p || a)/ ) {
      $input ~~ s/(\d+)\:(\d+)\s?(<[ap]>)m/{~$2 eq "a" ?? $0 !! $0 + 12 }\:$1/ ;
  }
  else {
      $input ~~ s/(\d+)\:(\d+) /
      { ($0 % 12) < 10 ?? '0' ~ ($0 % 12) !! $0 % 12}\:$1 { $0 < 12 ?? 'am'
                                !! 'pm' }/ ;
  }
  $input.trim.say ;
}
