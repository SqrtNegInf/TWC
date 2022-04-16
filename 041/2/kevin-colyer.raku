#!/usr/bin/env raku

use Test;


my @cache;
multi sub Leonardo(Int:D $n where * == 0) { 1 }
multi sub Leonardo(Int:D $n where * == 1) { 1 }
multi sub Leonardo(Int:D $n where * > 1 )  {
   return @cache[$n] if @cache[$n];
   return @cache[$n] = Leonardo($n-1)+Leonardo($n-2)+1;
}

say "$_ -> "~Leonardo($_) for ^21;
