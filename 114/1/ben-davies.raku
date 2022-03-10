#!/usr/bin/env raku

unit sub MAIN($n = '1234') {
    say ($n^..*).first({ $^x eq $^x.flip });
}
