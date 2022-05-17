#!/usr/bin/env raku

sub isPalindrome( Int $n is copy --> Bool ) {
      my $numberstr = ~$n ;
        return $numberstr eq $numberstr.flip ;
}

say (2 .. 999).grep( { $_.is-prime && isPalindrome( $_ ) } ).join( ',') ;
