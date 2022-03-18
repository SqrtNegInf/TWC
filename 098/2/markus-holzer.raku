#!/usr/bin/env raku

multi sub insert-pos(@N, $N ) {
  $_ + so @N[ $_ ] != $N given @N.grep( * <= $N, :k ).tail
}

multi sub insert-pos(@N, $N where $N > @N[*-1] ) { +@N }

multi sub insert-pos(@N, $N where $N < @N[0] ) { 0 }

say insert-pos(<1 2 3 4>, 3);
say insert-pos(<1 2 3 4>, 9);
say insert-pos(<1 2 3 4>, 0);
