#!/usr/bin/env perl
use v5.36;

for my $k ( sort keys %Calc:: ) {
    say $k;
}

package Calc;

use strict;
use warnings;

sub new { bless {}, shift; }
sub add { }
sub mul { }
sub div { }

1;
