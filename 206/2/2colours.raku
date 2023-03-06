#!/usr/bin/env raku

my token unsigned-integer { 0 | <[1..9]><[0..9]>* };
my token integer { '-'? <unsigned-integer> };
subset IntList of Str where /^ '(' <integer>* % ',' ')' $/;


#sub MAIN(Str $array) {
#  die 'Please supply a valid list of integers.' unless $array.subst(/\s/, '', :g) ~~ IntList;
  my Int() @array = <1 2 3 4 5 6>;
  @array.sort.rotor(1 => 1).flat.sum.say;
#}
