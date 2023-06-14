#!/usr/bin/env perl
use v5.36;

use Math::BaseCnv;

for (0..16) {
    say "Decimal $_ = Octal ",cnv($_,10,8);
}
