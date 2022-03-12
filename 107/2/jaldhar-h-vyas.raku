#!/usr/bin/env raku

class Calc
{
     method new { }
     method add { }
     method mul { }
     method div { }
}

sub MAIN(
) {
    for Calc.^methods -> $method {
        say $method;
    }
}
