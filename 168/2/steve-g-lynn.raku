#!/usr/bin/env raku

use Prime::Factor;

say homeprime(10);
#773
say homeprime(16);
#31636373
say homeprime(20);
#3318308475676071413

#-- sub for home prime

sub homeprime(Int $n where ($n > 1)) returns Int {
	$n.Int.is-prime && return $n;
	return homeprime(([~] prime-factors($n)).Int);
}


