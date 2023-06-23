#!/usr/bin/env perl
use v5.36;

use List::Util 'sum';

for (1 .. 50) {
    say unless $_ % sum split //;
}
