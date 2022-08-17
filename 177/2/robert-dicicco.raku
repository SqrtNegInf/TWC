#!/usr/bin/env raku

sub MidChar( $str) {

  given $str.chars {

    when (3) { return(substr($str,1,1)); }

    when (5) { return(substr($str,2,1)); }

    when (7) { return(substr($str,3,1)); }

    default  { return(-1); }

  }

}

sub IsOdd( $num ) {

  $num % 2 == 1 ?? True !! False;

}

my $count = 0;

my $candidate = 100;

while $count <= 20 {

  if IsOdd($candidate) && $candidate.is-prime && $candidate == $candidate.flip && MidChar($candidate) == 0 {

     print("$candidate ");

     $count++;

   }

  $candidate++;

}

print("\n");
