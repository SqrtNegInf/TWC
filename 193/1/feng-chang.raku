#!/usr/bin/env raku

unit sub MAIN(UInt:D \n where * > 0 = 4);

put (^2**n)».fmt("\%0{n}b").join(', ');
