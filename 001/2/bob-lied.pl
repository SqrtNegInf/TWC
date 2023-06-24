#!/usr/bin/env perl
use v5.36;

say ($_%15==0 ? 'fizzbuzz' : $_%5==0 ? 'buzz' : $_%3==0 ? 'fizz' : $_) foreach 1..20
