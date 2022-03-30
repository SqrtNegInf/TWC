#!/usr/bin/env raku

sub MAIN(
    Int $N where { $N > 0 } = 4
) {
    my $total = [+] (1 .. $N).map({ sprintf("%b", $_) ~~ m:g/ 1 /; });

    say "$total % 1000000007 = $total";
}
