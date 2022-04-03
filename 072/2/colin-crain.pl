#!/usr/bin/env perl

use warnings;
use strict;
use feature ":5.26";

## ## ## ## ## MAIN:

## remove these from @ARGV first
my $from = shift // 3;
my $to   = shift // 6;

## need to use $. the line number special variable
while (<DATA>) {
    print if $. == $from .. $. == $to;

}

__END__
L1
L2
L3
L4
L5
L6
L7
L8
L9
