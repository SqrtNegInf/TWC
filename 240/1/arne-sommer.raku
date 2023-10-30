#!/usr/bin/env raku

#unit sub MAIN ($chk, *@str where @str.elems > 0);
my @str = ("Perl", "Python", "Pascal");

say @str>>.substr(0,1).join.lc eq 'ppp'  #$chk.lc
  ?? 'true'
  !! 'false';
