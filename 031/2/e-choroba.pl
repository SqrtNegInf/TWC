#!/usr/bin/env perl
use v5.36;

my $var_name = 'foo';
{   no strict 'refs';
    ${ $var_name } = "Don't try this at home!";
    print "\$$var_name: ", $$var_name, "\n";
}
