#!/usr/bin/env raku

# not right answer

sub MAIN( Str $k = 'a', @letters = qw/d c a f/) {
    @letters.grep( $k le * ).sort.head.say;

}
