#!/usr/bin/env raku

subset Listy of Str where /^ '(' [\d+] ** 0..* % [\s* ',' \s*] ')' $/;

sub MAIN(
  Listy $list = '(4, 5, 1, 6)',
  Int $k where * != 0  = 2
) {
  $list
    .comb: /\d+/ andthen
    .combinations: 2 andthen
    .map: *.sum %% $k andthen
    .sum
    .say;    
}
