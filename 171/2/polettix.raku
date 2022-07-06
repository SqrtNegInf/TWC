#!/usr/bin/env raku

my $h1 = compose(-> ($x, $y) { $x / $y }, -> ($x, $y) { $y, $x });
say $h1(2, 10);

sub compose (&f, &g) { sub {f(g(@_))} }
