#!/usr/bin/env raku


sub MAIN( Int :$N = 1991 ) {
    say ~$N == ~$N.flip ?? '1' !! '0';
}
