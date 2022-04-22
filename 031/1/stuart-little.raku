#!/usr/bin/env raku

try {
    say 42.Real/42.Real;
    say 42.Real/0.Real;
}

($!) && say "Tried to divide by 0, eh?"
