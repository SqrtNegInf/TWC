#!/usr/bin/env raku

sub isPalindrome( Int $number ) {
  return ~$number eq ~$number.flip ;
}

sub MAIN( Int $N is copy = 1234 ) {
  repeat {
      ++$N ;
  } until ( isPalindrome( $N ) ) ;
  say $N ;
}
