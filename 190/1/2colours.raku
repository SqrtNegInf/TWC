#!/usr/bin/env raku

subset AsciiWord of Str where /^ <[a..zA..Z]>* $/;

sub MAIN(AsciiWord $s = 'Raku') {
  $s andthen
    $_ eq any(.tclc, .lc, .uc) andthen
    .so
    .Int
    .say;
}
