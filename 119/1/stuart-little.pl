#!/usr/bin/env perl
use v5.36;

say oct('0b'.sprintf("%04b", int(101) & 15) . sprintf("%04b", int(101) >> 4 & 15))
