#!/usr/bin/env raku

my &sum    = sub {    [+] @_ };
my &square = sub { @_ »*« @_ };

my &h = &sum ∘ &square;

say &h(1..10);
