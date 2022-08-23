#!/usr/bin/env raku

use Base::Any;

sub MAIN( Int:D $what = 11 ) {
    to-base(4,2i).say;
}
