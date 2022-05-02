#!/usr/bin/env raku

my sub ordinate (Str $_) {
  .uc.comb(/<[A..Z]>/)».ord X- 'A'.ord
}

#| Encode <message> using Vigenère cipher with <key>
multi MAIN (Str $message = 'ATTACKATDAWN', Str $key = 'LEMON', Bool :$encode) {
  my @key = ordinate $key;

  put ordinate($message).rotor(@key.elems, :partial).map({ (($_ Z+ @key) X% 26) X+ 'A'.ord})».Slip».chr.join
}

#| Decode <message> using Vigenère cipher with <key>
multi MAIN (Str $message, Str $key, Bool :$decode!) {
  my @key = ordinate $key;

  put ordinate($message).rotor(@key.elems, :partial).map({ (($_ Z- @key) X% 26) X+ 'A'.ord})».Slip».chr.join
}
