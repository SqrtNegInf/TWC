#!/usr/bin/env raku

unit sub MAIN (Str $char = '*');

"
    ^^^^^
   ^     ^
  ^       ^
 ^         ^
 ^         ^
 ^         ^
 ^         ^
 ^         ^
  ^       ^
   ^     ^
    ^^^^^
      ^
      ^
      ^
    ^^^^^
      ^
      ^
".subst('^', $char, :g).substr(1).print;
