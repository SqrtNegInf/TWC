#!/usr/bin/env raku

multi sylvester (  0 ) { 2 }
multi sylvester ( $n ) { sylvester( $n-1 )² - sylvester( $n-1 ) + 1 }

say .&sylvester for ^10
