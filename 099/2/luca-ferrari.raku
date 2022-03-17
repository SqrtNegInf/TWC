#!/usr/bin/env raku

sub MAIN( Str $S='littleit', Str $T='lit' ) {
    my $counter = 0;
    my $regexp = $T.comb.join( '.*' );

    # overlapping search
    given $S {
        for m:exhaustive/ <$regexp> / -> $match {
            $counter++;
        }
    }

    say $counter;
}
