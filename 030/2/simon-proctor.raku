#!/usr/bin/env raku

sub MAIN() {
    .join(",").say for (1..9).combinations(3).grep( { [<] $_ } ).grep( { 12 == [+] $_ } ).grep( { any($_) %% 2 } );
}
