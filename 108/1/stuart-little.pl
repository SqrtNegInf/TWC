#!/usr/bin/env perl
use v5.36;

use bignum qw/hex/;

my $x=5;
say qq|The variable \$x has value $x and address ${\ do{hex(sprintf("%p", $x))}}.|;
