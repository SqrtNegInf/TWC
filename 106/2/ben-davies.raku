#!/usr/bin/env raku

unit sub MAIN($n = 2, $d = 3) {
    say ($n / $d).base-repeating.reduce({ $^repeating ?? "$^base\($^repeating)" !! $^base });
}
