#!/usr/bin/env perl
use v5.36;

use bignum 'PI';

say PI()->bmul(sqrt(163))->bexp(32);
