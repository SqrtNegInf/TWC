#!/usr/bin/env perl

use 5.010;

say !($_ % 15) ? 'fizzbuzz'
  : !($_ %  3) ? 'fizz'
  : !($_ %  5) ? 'buzz'
  :              $_ for 1..20;
