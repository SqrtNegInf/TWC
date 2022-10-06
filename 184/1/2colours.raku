#!/usr/bin/env raku


my @list-numbers = <ab1234 cd5678 ef1342> andthen
#  prompt '@list = ' andthen
  .comb: / <[a..z]> ** 2 <[0..9]> ** 4 / andthen
  .map: *.substr(2);

('00' ... *) <<~<< @list-numbers ==>
  map "'" ~ * ~ "'"  ==>
  join ', ' ==>
  printf("(%s)\n");
