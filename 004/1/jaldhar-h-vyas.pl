#!/usr/bin/env perl
use v5.36;
use constant SIZE => 7;

use English qw/ -no_match_vars /;
use Math::BigFloat;

say Math::BigFloat->bpi((stat $PROGRAM_NAME)[SIZE]);
