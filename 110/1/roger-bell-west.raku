#!/usr/bin/env raku

for 'phone-numbers.txt'.IO.lines {
  say $_ if /^\s*(\+<[0..9]> ** 2|\(<[0..9]> ** 2\)|<[0..9]> ** 4)\s<[0..9]> ** 10\s*$/;
}
