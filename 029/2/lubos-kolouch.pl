#!/usr/local/bin/perl
use v5.36;

no lib '/usr/local/lib/perl5/site_perl/5.32.1';
no lib '/usr/local/lib/perl5/site_perl/5.32.0';

use Inline C => << 'END';

void print_c() {
    printf("test");
}

END

print_c;


