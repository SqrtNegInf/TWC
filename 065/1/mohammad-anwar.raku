#!/usr/bin/env raku

sub MAIN(Int :$N? where { $N > 1 } = 2, Int :$S? where { $S > 0 } = 10) {

    find-numbers($N, $S).join(", ").say;
}

sub find-numbers(Int $N, Int $S) {

    my $start = ('1' ~ '0' x ($N - 1)).Int;
    my $end   = ('9' x $N).Int;

    return ($start .. $end).grep( -> $n { $S == $n.split('').sum });
}
