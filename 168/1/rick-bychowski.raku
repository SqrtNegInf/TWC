#!/usr/bin/env raku

sub MAIN(Int $n = 13) {
    say "f($n) = ", pp($n);
}

sub pp(Int $n) {
    my @seed = <3 0 2>;
    my %pp;
    for 1 .. * -> $i {
        my $ppn = @seed[*-3] + @seed[*-2];
        @seed.push($ppn);
        %pp{$ppn} = 1 if $ppn.is-prime;
        last if %pp.elems == $n;
    }
    my @pp = %pp.keys.map({.Int}).sort;
}

