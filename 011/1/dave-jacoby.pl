#!/usr/bin/env perl
use v5.36;

# We're talking computing, so brute force is allowed

my $c  = -39;   # we COULD start at 0, but I know the answer...
my $f  = 32;    # I need $f > $c at this point, but we could do while...

while ( $c < $f ) {
    $c -= 0.1;
    $f  = 32 + ( $c * 9 / 5 );
}

say qq{$c °C == $f °F };

