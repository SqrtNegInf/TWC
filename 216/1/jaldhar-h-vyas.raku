#!/usr/bin/env raku

    my $reg = 'AB1 2CD'; my @words = ('abc', 'abcd', 'bcd');
    my @registration = $reg.comb.grep({$_ ~~ /<alpha>/}).unique.map({ $_.lc });
    my @results;

    for @words -> $word {
        my @w = $word.comb.grep({$_ ~~ /<alpha>/}).unique.map({ $_.lc });
        if @registration ⊆ @w {
            @results.push($word);
        }
    }

    say q{(}, @results.map({"'$_'"}).join(q{, }), q{)};
