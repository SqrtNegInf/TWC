#!/usr/bin/env perl
use v5.36;

use Carp;

sub hofstadter_F {
    my $n = shift;
    state %cache = ( 0 => 1 );

    return $cache{$n} if exists $cache{$n};
    return $cache{$n} = $n - hofstadter_M( hofstadter_F( $n - 1 ) );
}

sub hofstadter_M {
    my $n = shift;
    state %cache = ( 0 => 0 );

    return $cache{$n} if exists $cache{$n};
    return $cache{$n} = $n - hofstadter_F( hofstadter_M( $n - 1 ) );
}

my $n = 19;

say "F: ", join( ", ", map { hofstadter_F($_) } ( 0 .. $n ) );
say "M: ", join( ", ", map { hofstadter_M($_) } ( 0 .. $n ) );
