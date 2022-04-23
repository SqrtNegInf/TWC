#!/usr/bin/env raku

sub MAIN(
    @n = [1, 3, 5, 7, 9 ]
) {
    for 0 ..^ @n.elems -> $i {
        if ([+] @n[0 ..^ $i]) == ([+] @n[$i ^..^ @n.elems]) {
            say $i;
            exit;
        }
    }

    say -1;
}
