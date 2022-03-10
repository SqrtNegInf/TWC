#!/usr/bin/env raku

sub MAIN(Int $N = 1234) {
    my $next = $N + 1;
    do $next++ until $next == $next.flip;
    say $next;
}
