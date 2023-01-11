#!/usr/bin/env raku

unit sub MAIN(UInt:D \m = 100);

put (^m).grep(*.is-prime).elems;
