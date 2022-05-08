#!/usr/bin/env raku

sub compactify(@a) {
    S:g/\D*\-\D*/-/ with @a.sort.unique.map({ (($_-1,$_,$_+1).all == @a.any) ?? '-' !! $_ }).join(',')
}

say <1 2 3 4 9 10 14 15 16>.map(*.Int).&compactify
