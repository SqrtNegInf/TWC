#!/usr/bin/env raku

for [X] ( 1..10 ) xx 3 {
  .fmt('%2u', '|').say when .sum == 12;
}
