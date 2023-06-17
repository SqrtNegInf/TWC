#!/usr/bin/env perl
use v5.36;

no strict 'refs';

# Note all sorts of bad things can still be done with this code - like a
# user might pass in the name of an existing variable, might start a
# variable name with a number, etc.  We make it safer but not safe.

my $varname = 'foo';
my $value   = 'boo';

#die "Invalid variable name" if $varname !~ m/^ \w+ $/s; # Doesn't catch everything

$$varname = $value;
say "\$$varname = $value";

