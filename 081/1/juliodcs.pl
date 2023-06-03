#!/usr/bin/env perl
use v5.36;

use List::MoreUtils 'uniq';

say for uniq map { /^(.+)\1+$/; $1 // () } <abcdabcd abcdabcdabcdabcd>
