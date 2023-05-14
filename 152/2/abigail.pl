#!/usr/bin/env perl
use v5.36;

use List::Util qw [min max];

while (<DATA>) {my @F = split; # Mimic -a

    say        +(max (@F [0, 2]) - min (@F [0, 2]))  *
                (max (@F [1, 3]) - min (@F [1, 3]))  +
                (max (@F [4, 6]) - min (@F [4, 6]))  *
                (max (@F [5, 7]) - min (@F [5, 7]))  -   
    max (0, min (max (@F [0, 2]),  max (@F [4, 6]))  -
            max (min (@F [0, 2]),  min (@F [4, 6]))) *  
    max (0, min (max (@F [1, 3]),  max (@F [5, 7]))  -
            max (min (@F [1, 3]),  min (@F [5, 7])));

}

__END__
-1 0 2 2 0 -1 4 4
