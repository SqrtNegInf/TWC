#!/usr/bin/env raku

use Prime::Factor;

say (2..12).map(&home-prime);

multi home-prime($n where $n == 49|77) { Any }

multi home-prime($n is copy)
{
    $n = prime-factors($n).join.Int;
    return $n if $n.is-prime;
    home-prime($n)
}    
