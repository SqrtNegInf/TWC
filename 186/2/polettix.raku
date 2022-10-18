#!/usr/bin/env raku

sub MAIN {
   put makeover('âÊíÒÙ whatever123 ÃÊÍÒÙ');
}

sub makeover ($str) {
   $str.comb(/./)».NFD.map(
      -> $c {
         my ($basic) = $c.list;
         ('a'.ord <= $basic <= 'z'.ord) || ('A'.ord <= $basic <= 'Z'.ord)
         ?? $basic.chr !! $c;
      }
   ).join('');
}
