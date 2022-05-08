#!/usr/bin/env perl

# not particularly close...

use strict;
use warnings;
use feature "switch";

use Math::BigFloat qw(bpi);
my $precision =32;
my $x = bpi($precision)*sqrt(163);
$x->bexp($precision);
print "$x\n";


