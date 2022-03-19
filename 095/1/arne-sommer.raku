#!/usr/bin/env raku

unit sub MAIN (Numeric $N = 2002);

say + ($N eq $N.flip);
