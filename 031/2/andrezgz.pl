#!/usr/bin/env perl
use v5.36;

my $var_name = 'foo';

# It's gettin' ugly
no strict 'refs';                                  # This works sometimes, but it's a very bad idea.
${$var_name} = 'boo';                              # For reasons and better alternatives refer to
print 'worked' if ${$var_name} eq 'boo';           # https://metacpan.org/pod/perlfaq7#How-can-I-use-a-variable-as-a-variable-name
