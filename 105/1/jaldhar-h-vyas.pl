#!/usr/bin/env perl
use v5.36;

use English qw/ -no_match_Vars /;
use Math::Round;

my ($N, $k) = (5,34);
say nearest(0.01, $k ** (1.0 / $N));
