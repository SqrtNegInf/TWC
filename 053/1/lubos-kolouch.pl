#!/usr/bin/env perl5.32.1

use strict;
use warnings;
use PDL;
use feature qw/say/;


# When researching this topic, I found:
# https://stackoverflow.com/questions/21433364/use-perl-pdl-to-rotate-a-matrix
# and then adapted it using e-choroba's slicing. 
#
# PDL seems very interesting!

my $m = sequence(3,3)+1;

print($m);

for (0..2) {
    say(90*($_+1));
    $m = $m->transpose->slice([-1,0]);
    print($m);
}

