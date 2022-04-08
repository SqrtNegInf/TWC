#!/usr/bin/env raku

sub MAIN(
    Int $X=2,     #= number of digits in output numbers
    Int $Y=21,     #= output numbers must be less than this amount
    @L=(0, 1, 2, 5)
) {
    my @output =
        @L.combinations($X).map( { | ( $_.join() + 0, $_.join().flip + 0); });

    @output.push(| @L.map({ ($_ x $X) + 0; }) );

    @output.sort.grep({ $_.chars == $X && $_ < $Y; }).join(q{, }).say;
}
