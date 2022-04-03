#!/usr/bin/env raku

sub trailing-zeros($n) {
    [+] (floor($n / 5**$_) for 1..floor($n**(1/5) + 1));
}

#trailing-zeros(125).say;
trailing-zeros(25).say;
trailing-zeros(10).say;
trailing-zeros(7).say;
trailing-zeros(4).say;
