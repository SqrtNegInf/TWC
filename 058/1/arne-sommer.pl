#!/usr/bin/env perl
use v5.36;

say version->parse( '1.2.1' ) <=> version->parse( '1.2_2' );
