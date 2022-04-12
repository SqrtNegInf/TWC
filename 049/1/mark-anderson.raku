#!/usr/bin/env raku

sub MAIN(Int $arg where $arg > 0 = 55) {
    1 .. Inf             ==> 
    map   { .fmt("%b") } ==> 
    first { $_ %% $arg } ==>
    say();
}
