#!/usr/bin/env raku

#| Print the decimal to octal from start to end
sub MAIN (
    Int() :$start-val = 0, #= Start value (default 0)
    Int() :$end-val = 50, #= End value (default 50)
) {
    for $start-val..$end-val -> \val {
        say "Decimal {val} = Octal {val.base(8)}";
    }
}
