#!/usr/bin/env perl
use v5.36;

sub count_words ( $prefix, @words ) {
    scalar( grep { /^ $prefix /x } @words );
}

sub MAIN() {

    #| Run test cases
    use Test::More tests => 2;

    is_deeply count_words( 'at', ( "pay", "attention", "practice", "attend" ) ), 2,
      'works for ("pay", "attention", "practice", "attend")';
    is_deeply count_words( ( 'ja', "janet", "julia", "java", "javascript" ) ), 3,
      'works for ("janet", "julia", "java", "javascript")';
}

MAIN();
