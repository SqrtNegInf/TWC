#!/usr/bin/env raku

#| Find the nest highest integer that's a palindrome
sub MAIN( Int $N  = 1234) {
    ($N^..*).first( { $_ ~~ $_.flip } ).say
}
