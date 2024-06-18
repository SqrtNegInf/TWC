#!/usr/bin/env raku

my @tests = < aabb abab aaa bbb >;

for @tests -> $test {
    say lc ?($test ~~ / bb /);
}
