#!/usr/bin/env raku

#sub MAIN (*@args) { put count-odd-one-out(@args) }

#sub count-odd-one-out (@words) {
   my @words = ('abc', 'xyz', 'tsu');
   my $i = 0;
   say sum gather for ^@words {
      if @words[$i] le @words[$_] { $i = $_ }
      else                        { take 1  }
   }
#}
