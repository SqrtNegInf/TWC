#!/usr/bin/env perl
use v5.36;

use bignum 'bpi';
print bpi((stat($0))[7]);
