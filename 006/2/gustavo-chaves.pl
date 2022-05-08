#!/usr/bin/env perl

use 5.026;
use strict;
use warnings;
use bignum 'PI';

say PI()->bmul(sqrt(163))->bexp(32);
