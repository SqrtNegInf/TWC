#!/usr/bin/env perl

# https://perlweeklychallenge.org/blog/perl-weekly-challenge-031/
# Task #2
# Create a script to demonstrate creating dynamic variable name,
# assign a value to the variable and finally print the variable.
# The variable name would be passed as command line argument.

use strict;
use warnings;

my $var_name = 'foo';

# It's gettin' ugly
no strict 'refs';                                  # This works sometimes, but it's a very bad idea.
${$var_name} = 'boo';                              # For reasons and better alternatives refer to
print 'worked' if ${$var_name} eq 'boo';           # https://metacpan.org/pod/perlfaq7#How-can-I-use-a-variable-as-a-variable-name
