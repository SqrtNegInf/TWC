#!/usr/bin/env perl
use warnings;
use strict;

my $var_name = 'foo';
{   no strict 'refs';
    ${ $var_name } = "Don't try this at home!";
    print "\$$var_name: ", $$var_name, "\n";
}
