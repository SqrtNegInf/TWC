#!/usr/bin/env raku

sub MAIN(Int $n = 36) {
    say (2 .. $n div 2)
        .grep({ $n %% $_ })
        .map({  [+] ($_, $n div $_) })
        .combinations(2)
        .grep({ ([-] $_).abs == 1 })
        !~~ () ?? 1 !! 0;
}
