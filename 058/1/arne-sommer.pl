#!/usr/bin/env perl

use version;
use feature say;

say version->parse( '1.2.1' ) <=> version->parse( '1.2_2' );
