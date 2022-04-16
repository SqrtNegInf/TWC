#!/usr/bin/env raku

use Test;

# Roll my own version because? Why not!
sub dec-to-oct(Int $n is copy) returns Str {
    return "0" if $n==0;
    my Str $o = "";
    while $n>0 {
        $o= $n +& 7 ~ $o; # add lower three bits
        $n= $n +> 3     ; # shift off lower three bits
    }
    return $o;
}

say "Decimal $_ = Octal {dec-to-oct($_)} is sprintf conversion {sprintf "%o", $_}" for ^51;
