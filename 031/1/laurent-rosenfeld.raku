#!/usr/bin/env raku

sub MAIN (Numeric $numerator = 42, Numeric $denominator = 0) {
    try {
        say "Result of division is: ", $numerator / $denominator;
    } or say "Houston, we've had a problem here: ",  $!.Str;
}
