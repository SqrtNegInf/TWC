#!/usr/bin/env raku

sub MAIN ( @values  = [ 2, 5, -1, 3 ]) {
    sub-lists( @values ).sort( -> $l { [*] @$l } ).reverse.first.say;
}

sub sub-lists( @list ) {
    gather {
        for ^@list -> $start {
            for $start..^@list -> $end {
                take @list[$start..$end];
            }
        }
    }
}
