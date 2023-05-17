#!/usr/bin/env perl
use v5.36;

use ntheory qw<nth_prime>;
say nth_prime(10_001);
