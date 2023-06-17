#!/usr/bin/env perl
use v5.36;

use List::Util qw( uniq );

sub common_characters (@words) {
    my %characters;
    my @letters = map( { uniq split( //, lc($_) ) } @words );
    map( { $characters{$_}++ } @letters );
    my @cc = sort grep( { $characters{$_} == @words } keys %characters );
    return @cc;
}

#| Run test cases
sub MAIN() {
    use Test::More;

    is_deeply([common_characters( "Perl", "Rust", "Raku" )], ['r']);                # 'works for ("Perl", "Rust", "Raku")';
    is_deeply([common_characters( "love", "live", "leave" )], [ 'e', 'l', 'v' ]);   # 'works for ("love", "live", "leave")';
    done_testing();
}

MAIN();
