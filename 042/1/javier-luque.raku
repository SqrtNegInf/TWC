#!/usr/bin/env raku

sub MAIN() {
    for (1..50) -> $i {
        say 'Decimal '  ~ $i ~
            ' = Octal ' ~ to-octal($i);
    }
}

sub to-octal(Int $i) {
    return sprintf('%o', $i);
}
