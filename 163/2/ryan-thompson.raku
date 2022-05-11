#!/usr/bin/env raku

sub MAIN(@n = (1,5,4,3,2,6,7) ) {
    sum_rec(|@n).say;
}

sub sum_rec(*@n) {
    return @n[0] if @n.elems == 1;
    sum_rec((1..@n.elems-1).map({ [+] @n[1..$_] }));
}
