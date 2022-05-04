#!/usr/bin/env raku

use Math::Matrix;

unit sub MAIN (Int $size where $size > 0 = 5);

my $im = Math::Matrix.new-identity( $size );

say $im;
