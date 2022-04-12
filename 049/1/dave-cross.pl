#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

# Input checking
# * We've got an argument
# * It only contains digits
# * It's not zero

my $num = 55;
my $x   = 1;

$x++ while ($num * $x) =~ /[^01]/;

say "$num x $x = ", $num * $x;
