#!/usr/bin/env perl
use v5.36;

# not quite right...

use utf8;
use bignum;

use constant π => 3.14159265359;
use constant 𝑒 => 2.71828182846;

say 𝑒**(π * sqrt(163));
