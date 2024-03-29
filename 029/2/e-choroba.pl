#!/usr/local/bin/perl
use v5.36;

no lib '/usr/local/lib/perl5/site_perl/5.32.1';
no lib '/usr/local/lib/perl5/site_perl/5.32.0';

use Inline 'C';

use Test::More tests => 2;

is factorial(20), 2432902008176640000;
is greet('world'), 'Hello world!';

__END__
__C__

long factorial (long n) {
    long r = 1;
    for (long i = 2; i <= n; i++) r *= i;
    return r;
}

SV *greet (SV* name) {
    return(newSVpvf("Hello %s!", SvPV(name, PL_na)));
}
