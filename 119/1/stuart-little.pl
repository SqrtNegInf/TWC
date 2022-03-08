#!/usr/bin/env perl
use warnings;
use v5.12;

# run <script> <number>

say oct('0b'.sprintf("%04b", int(101) & 15) . sprintf("%04b", int(101) >> 4 & 15))
