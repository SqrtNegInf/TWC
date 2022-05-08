#!/usr/bin/env perl

use strict;
use warnings;

use Math::BigFloat qw/bpi/;

print Math::BigFloat->new(163)->bsqrt->bmul(bpi)->bexp(32);
