#!/usr/bin/env raku

multi MAIN (@list where @list.elems >= 1 && @list.all ~~ Int = <1 2 3 4 5 6>) {
    my @res;
    my @sorted = @list>>.Int.sort;
    my @evens = grep {$_ %% 2}, @sorted;
    my @odds = grep {$_ % 2}, @sorted;

    for (^@evens.elems) -> $x {
        @res.push: @evens[$x];
    }

    for (^@odds.elems) -> $x {
        @res.push: @odds[$x];
    }

    print "(", join ', ', flat(@res);
    print ")";
}
