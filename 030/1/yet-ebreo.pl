#!/usr/bin/env perl
use v5.36;

use POSIX 'strftime';

map { !strftime("%w", 0, 0, 0, 25 , 11, $_ - 1900, -1, -1, -1) && say "12/25/$_" } 2019..2100;
