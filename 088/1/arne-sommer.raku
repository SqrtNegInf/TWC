#!/usr/bin/env raku

subset PositiveInt of Int where * > 0;

#unit sub MAIN (*@N where @N.elems && all(@N) ~~ PositiveInt);

my @N = <5 2 1 4 3>;

my $product = [*] @N;

my @M = @N.map( { $product / $_ });

say '(', @M.join(', '), ')';
