#!/usr/bin/env perl
use v5.36;

use Math::BigFloat;

printf "%.33s\n",Math::BigFloat->new(1)->bexp **
    (Math::BigFloat->bpi * Math::BigFloat->new(163)->bsqrt);
