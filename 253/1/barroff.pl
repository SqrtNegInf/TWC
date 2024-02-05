#!/usr/bin/env perl
use v5.36;

sub split_strings ( $separator, @words ) {
    my @res = grep( { length($_) > 0 }
        map( { split( /\Q$separator\E/, $_ ) } @words ) );

    return \@res;
}

sub MAIN() {
    if (@ARGV) {

        #| Run on command line argument
        say split_strings( $ARGV[1], @ARGV[ 2 .. -1 ] );
    }
    else {
        #| Run test cases
        use Test::More;

        is_deeply split_strings( ".", ( "one.two.three", "four.five", "six" ) ),
          [ "one", "two", "three", "four", "five", "six" ],
          'works for ("one.two.three","four.five","six")';
        is_deeply split_strings( '$', ( '$perl$$', '$$raku$' ) ), [ "perl", "raku" ],
          'works for ("$perl$$", "$$raku$")';
        done_testing
    }
}

MAIN();
