#!/usr/bin/env raku

sub hello() {
    "Hello";
}

sub fib($n) {
    if ($n < 1) {
        return 0;
    }
    if ($n == 1) {
        return 1;
    }
    return fib($n - 1) + fib($n - 2);
}

my %dispatch = (
    hello => &hello,
    world => sub { "World"; },
    fib => &fib
);

say %dispatch{"hello"}() ~ " " ~ %dispatch{"world"}();
say %dispatch{"fib"}(20);
