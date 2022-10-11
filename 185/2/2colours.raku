#!/usr/bin/env raku

my @list = qq<'ab-cde-123' '123.abc.420' '3abc-0010.xy'>.comb: / \' .*? \' /;
  
s:4x/ <[0..9a..z]> /x/ for @list;
say "(@list.join(', '))";
