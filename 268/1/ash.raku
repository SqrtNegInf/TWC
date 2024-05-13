#!/usr/bin/env raku

my @tests =
    ([3, 7, 5], [9, 5, 7]),
    ([1, 2, 1], [5, 4, 4]),
    ([2], [5]),
    
    ([3, 7, 5], [9, 5, 17]);

for @tests -> (@a is copy, @b is copy) {
    @a .= sort;
    @b .= sort;

    my $diff = @b[0] - @a[0];
    if @a >>+>> $diff eqv @b {
        say $diff;
    }
    else {
        say "No such number";
    }
}
