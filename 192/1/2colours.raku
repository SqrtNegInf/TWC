#!/usr/bin/env raku

subset PosInt of Int where * > 0;

say 2⁶⁴ -2;
sub MAIN(PosInt $n = 2⁶⁴ +1) {
  $n.msb // 0 andthen
    2 +< $_ - 1 andthen
    $_ - $n andthen
    .say;    
}
