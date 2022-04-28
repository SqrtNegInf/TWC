#!/usr/bin/env raku

sub MAIN ($string where .chars >0  = 'bookkeeper') {
    .Str.say for $string ~~ m:g / ((.) $0*) /
}
