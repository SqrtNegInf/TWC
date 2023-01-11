#!/usr/bin/env perl

use v5.36;
use Math::Prime::Util qw(prime_count);
say "$_ -> ", prime_count($_-1) for 100;
