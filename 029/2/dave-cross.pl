#!/usr/local/bin/perl

use strict;
use warnings;

no lib '/usr/local/lib/perl5/site_perl/5.32.1';
no lib '/usr/local/lib/perl5/site_perl/5.32.0';

use Inline C => <<'END_OF_C';

void hello(char* name) {
  printf("Hello, %s\n", name);
}

END_OF_C

my $name = shift || 'Perl';

hello($name);
