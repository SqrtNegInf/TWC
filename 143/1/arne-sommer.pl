#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

my $s = $ARGV[0] // '3*2+2';

$s =~ /^[0-9\(\)\+\-\*\s]+$/
    ? say eval($s)
    : say "Error";
