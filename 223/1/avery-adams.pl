#!/usr/bin/env perl

use strict;
use v5.24;
use Math::Prime::Util 'primes';

say scalar @{primes(shift)};
