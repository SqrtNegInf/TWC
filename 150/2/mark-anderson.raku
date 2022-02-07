#!/usr/bin/env raku

use Prime::Factor;

(1..500).grep({ not prime-factors($_).repeated }).join(' ').say;
