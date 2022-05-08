#!/usr/bin/env perl

# not decimal

use strict;
use warnings;
use bigrat qw<bexp bpi>;
print bexp(bpi(50)*sqrt(163),50);
