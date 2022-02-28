#!/usr/bin/env raku

#| Integer Square Root
sub MAIN(UInt $n = 10) {
    my $x = $n +> 1;
    loop {
        given ($x + ($n / $x)) / 2 {
            last if $x == $_;
            $x = $_;
        }
    }
    put $x;
}
