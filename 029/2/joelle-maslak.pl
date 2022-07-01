#!/usr/local/bin/perl
use v5.22;
use strict;
use warnings;

no lib '/usr/local/lib/perl5/site_perl/5.32.1';
no lib '/usr/local/lib/perl5/site_perl/5.32.0';

use Inline 'C';

MAIN: {
    say "15! = " . factorial(15);
}

__END__
__C__

long factorial(long x) {
    if (x < 0) { return -1; }
    if (x < 1) { return  1; }

    return x * factorial(x-1);
}

