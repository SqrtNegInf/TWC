#!/usr/bin/env raku

my @line = ();

sub next_line {
  @line[$_-1] += (@line[$_]||0) for 1..@line;
  unshift @line, 1;
  return @line;
}

sub MAIN($n = 10) {
  say next_line() for 1..$n;
}
