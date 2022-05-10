#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';

say $_ for grep { $_ % 15 == 0 ? $_ = 'fizzbuzz' : $_ % 5 == 0
	? $_ = 'fizz' : $_ % 3 == 0 ? $_ = 'buzz' : $_ } 1..20;
