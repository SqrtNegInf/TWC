#!/usr/bin/env raku

sub MAIN(
  @array = ('d', 'c', 'a', 'f'),
  $target = 'a'
) {
  @array
    .grep: * after $target andthen
    .so ?? .min !! $target andthen
    .say; 
}
