#!/usr/bin/env perl

use strict;
use warnings;
use feature qw/say/;
use Test::More;

sub assing_variable {
    my $var_name = shift;
    no strict 'refs';

    # it works, but I would not like to debug it...
    ${$var_name} = "test";
    return 1;
}

my $name = 'foo';
assing_variable($name);

# TESTS

$name='bla';
assing_variable($name);

no strict 'refs';
is($$name,'test');

done_testing();

