#!/usr/bin/env perl
use v5.36;

sub bball_ways ( $S ) {
    use constant SHOT_VALUES => [ 1, 2, 3 ];
    return [] if $S == 0;
    return    if $S <  0;

    my @ret;

    for my $n ( SHOT_VALUES->@* ) {
        push @ret, map [ $n, @{$_} ], bball_ways($S - $n);
    }

    return @ret;
}

say join(' ', @{$_}) for bball_ways( 4 );
