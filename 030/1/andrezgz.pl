#!/usr/bin/env perl
use v5.36;

use DateTime;

do { print $_.$/ if DateTime->new( year => $_, month => 12, day => 25 )->dow == 7 } for ( 2019 .. 2100 );
