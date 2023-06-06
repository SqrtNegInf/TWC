#!/usr/bin/env perl
use v5.36;

use lib ".";
use MajorityElement;

my @ARR = (1, 2, 2, 3, 2, 4, 2);

die "Give a list of integers" unless @ARR;

say majorityElement(@ARR);
