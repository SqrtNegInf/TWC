#!/usr/bin/env raku

subset PositiveInt of Int where { $_ ~~ Int && $_ > 0 }

sub USAGE {
    print Q:c:to/EOH/;
    Usage: {$*PROGRAM-NAME} <list>

    Example: {$*PROGRAM-NAME} 1 2 3 4 5
EOH
}

#sub MAIN(*@N where all(@N) ~~ PositiveInt && @N.elems > 0) {
    my @N = <5 2 1 4 3>;
    my $product = [*] @N;
    my @M = @N.map: $product / *;
    say @M;
#}
