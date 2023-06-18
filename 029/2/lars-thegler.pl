#!/usr/local/bin/perl
use v5.36;

no lib '/usr/local/lib/perl5/site_perl/5.32.1';
no lib '/usr/local/lib/perl5/site_perl/5.32.0';

use Modern::Perl;

# Write a script to demonstrate calling a C function. It could be any
# user defined or standard C function.

use Inline 'C';

greet( shift // 'world' );

__END__
__C__

void greet(char* name)
{
    printf("Hello, %s!\n", name);
}
