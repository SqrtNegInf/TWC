#!/usr/bin/env raku
use v6;

# run <script> <number>

say 5.Int.base(2).Str.grep({ $_ eq $_.flip }).elems;
