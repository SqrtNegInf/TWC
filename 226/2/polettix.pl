#!/usr/bin/env perl
use v5.36;

use List::Util 'uniq';
say scalar grep { $_ } uniq (1, 5, 0, 3, 5);
