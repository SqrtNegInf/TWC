#!/usr/bin/env raku


sub MAIN( Int $N where { $N > 10 } = 1234 ) {
    say $_ and exit  if $_ == $_.Str.flip.Int for $N ^.. Inf;
}
