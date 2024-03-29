#!/usr/bin/env raku

sub isCute(@list) {
    my $i = 1;

    for @list -> $elem {
        if ($i % $elem && $elem % $i) {
            return False;
        }
        $i++;
    }
    return True;
}

sub MAIN(
    Int $n where { $_ ~~ 1 .. 15 } = 8
) {
    (1 .. $n).permutations.grep({ isCute(@$_); }).elems.say;
}
