#!/usr/bin/env perl
use v5.36;

use List::Util qw{ sum };

say for grep 0 == $_ % sum(split //), 1 .. 50;
