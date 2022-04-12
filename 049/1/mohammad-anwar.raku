#!/usr/bin/env raku

use v6;

sub MAIN(Int $num = 55) {
    my (Int $res, Int $i);
    repeat { $res = $num * ++$i } until $res ~~ /^<[01]>+$/;
    $res.say;
}
