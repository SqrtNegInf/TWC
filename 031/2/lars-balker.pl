#!/usr/bin/env perl
use v5.36;

no strict 'refs'; # we're specifically abusing this feature

my $var = 'foo';

$$var = 42;
print $$var, "\n";
