#!/usr/bin/env perl
use v5.36;

# not decimal

use bigrat qw<bexp bpi>;
print bexp(bpi(50)*sqrt(163),50);
